library ieee;
use ieee.std_logic_1164.all;
--
-- Опис констант сигналів і команд
-- WAIT_SIGNAL - сигнал очікування команди - 0000
-- STOP_SIGNAL - сигнал завершення командного потоку - Z-стан
-- UV_COMMAND - команда UV - 0001
-- PU_COMMAND - команда PU - 0010
-- PV_COMMAND - команда PV - 0100
-- NP_COMMAND - команда NP - 1000
--

package HEADER is
  constant WAIT_SIGNAL : std_logic_vector(3 downto 0);
  constant UV_COMMAND : std_logic_vector(3 downto 0);
  constant PU_COMMAND : std_logic_vector(3 downto 0);
  constant PV_COMMAND : std_logic_vector(3 downto 0);
  constant NP_COMMAND : std_logic_vector(3 downto 0);
  constant STOP_SIGNAL : std_logic_vector(3 downto 0);
end HEADER;

package body HEADER is
  constant WAIT_SIGNAL : std_logic_vector(3 downto 0) := "0000";
  constant UV_COMMAND : std_logic_vector(3 downto 0) := "0001";
  constant PU_COMMAND : std_logic_vector(3 downto 0) := "0010";
  constant PV_COMMAND : std_logic_vector(3 downto 0) := "0100";
  constant NP_COMMAND : std_logic_vector(3 downto 0) := "1000";
  constant STOP_SIGNAL : std_logic_vector(3 downto 0) := "ZZZZ";
end HEADER;

