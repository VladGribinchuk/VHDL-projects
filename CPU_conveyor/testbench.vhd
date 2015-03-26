library ieee;
use ieee.std_logic_1164.all;
use work.HEADER.all;

entity testbench is
end testbench;

architecture A_testbench of testbench is
	component CPU
		port(
			clk   : in  std_logic;
			data  : in  std_logic_vector(3 downto 0));
	end component cpu;
	
	signal clk : std_logic;
	signal data : std_logic_vector(3 downto 0);
begin
	TEST_FOR_CPU : CPU
		port map(
			clk   => clk,
			data  => data);	
	
	impulse_cycl : process is
	begin
		loop
			clk<= '0';
			wait for 10 ns;
			clk<= '1';
			wait for 10 ns;
		end loop;
	end process impulse_cycl;
	
	testbench : process is
	begin
		data<=WAIT_SIGNAL;
		wait for 20 ns;
		data<=UV_COMMAND;
		wait for 20 ns;
		data<=UV_COMMAND;
		wait for 20 ns;
		data<=UV_COMMAND;
		wait for 20 ns;
		data<=UV_COMMAND;
		wait for 20 ns;
		data<=PU_COMMAND;
		wait for 20 ns;
		data<=PU_COMMAND;
		wait for 20 ns;
		data<=PU_COMMAND;
		wait for 20 ns;
		data<=PU_COMMAND;
		wait for 20 ns;
		data<=PV_COMMAND;
		wait for 20 ns;
		data<=PV_COMMAND;
		wait for 20 ns;
		data<=PV_COMMAND;
		wait for 20 ns;
		data<=PV_COMMAND;
		wait for 20 ns;
		data<=NP_COMMAND;
		wait for 20 ns;
		data<=NP_COMMAND;
		wait for 20 ns;
		
		data<=STOP_SIGNAL;
		wait for 20 ns;
		
		data<=WAIT_SIGNAL;
		wait for 20 ns;
		
	end process testbench;		
end architecture A_testbench;


