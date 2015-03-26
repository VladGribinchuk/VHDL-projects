library ieee;
use ieee.std_logic_1164.all;
use work.HEADER.all;

-- Інтерфейс і архітектура конвеєра
-- input - вхідна команда
-- flag - прапорець стану конвеєра (1 - зайнятий, 0 -вільний)
entity conveyor is
	port(
		input : in std_logic_vector(3 downto 0);
		flag : out bit);
end entity conveyor;
architecture A_conveyor of conveyor is
	signal is_busy : bit;
begin

	p1 : process(input)
	begin
		if  input = WAIT_SIGNAL then
			is_busy<='0'; 
		end if;
		if  input /= WAIT_SIGNAL then
			is_busy<='1', '0' after 10 ns; 
		end if;	
	end process p1;
	flag<=is_busy;
end architecture A_conveyor;

library ieee;
use ieee.std_logic_1164.all;
use work.HEADER.all;

entity CPU is
	port(
		clk : in std_logic;
		data : in std_logic_vector(3 downto 0));
end entity CPU;
architecture A_CPU of CPU is
	component conveyor
		port(
			input : in  std_logic_vector(3 downto 0);
			flag  : out bit);
	end component conveyor;
	shared variable MEM : std_logic_vector(63 downto 0);
	shared variable P_MEM,P_CMD : integer := 0;
	signal first_command : std_logic_vector(3 downto 0);
	signal second_command : std_logic_vector(3 downto 0);
	signal U_WORK,V_WORK : bit;
begin
	U: conveyor
		port map(
			input => first_command(3 downto 0),
			flag  => U_WORK);
	V: conveyor
		port map(input => second_command(3 downto 0),
			 flag  => V_WORK); 
	
	load_command : process(clk,data) is
	begin
		if rising_edge(clk) and data /= WAIT_SIGNAL then
			if data=STOP_SIGNAL then 
			P_MEM := P_MEM + 1;
			else
			MEM(3+4*P_MEM downto 4*P_MEM):=data;
			P_MEM := P_MEM + 1;
			end if;
		end if;
	end process load_command;
	
	execute : process(clk) is
	begin
		if rising_edge(clk) and P_MEM-P_CMD >= 2 then
			if MEM(3+4*P_CMD downto 4*P_CMD)=UV_COMMAND or
				MEM(3+4*P_CMD downto 4*P_CMD)=PU_COMMAND 
			then
				if MEM(3+4*(P_CMD+1) downto 4*(P_CMD+1))=UV_COMMAND or 
					MEM(3+4*(P_CMD+1) downto 4*(P_CMD+1))=PV_COMMAND 
				then
					    first_command <= MEM(3+4*P_CMD downto 4*P_CMD), WAIT_SIGNAL after 10 ns;
					    second_command <= MEM(3+4*(P_CMD+1) downto 4*(P_CMD+1)), WAIT_SIGNAL after 10 ns;
					    P_CMD := P_CMD + 2;
				else
					    first_command <= MEM(3+4*P_CMD downto 4*P_CMD), WAIT_SIGNAL after 10 ns;
					    second_command <= WAIT_SIGNAL;
					    P_CMD := P_CMD + 1;
			    	end if;
			 else
			 	first_command <= MEM(3+4*P_CMD downto 4*P_CMD), WAIT_SIGNAL after 10 ns;
				second_command <= WAIT_SIGNAL;
				P_CMD := P_CMD + 1;
			end if;
		end if;
	end process execute;
end architecture A_CPU;


