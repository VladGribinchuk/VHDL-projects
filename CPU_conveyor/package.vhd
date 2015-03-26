library ieee;
use ieee.std_logic_1164.all;
--
-- ���� �������� ������� � ������
-- WAIT_SIGNAL - ������ ���������� ������� - 0000
-- STOP_SIGNAL - ������ ���������� ���������� ������ - Z-����
-- UV_COMMAND - ������� UV - 0001
-- PU_COMMAND - ������� PU - 0010
-- PV_COMMAND - ������� PV - 0100
-- NP_COMMAND - ������� NP - 1000
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

