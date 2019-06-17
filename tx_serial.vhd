library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
--------------------------------------------------------
entity tx_serial is -- Entradas e saidas com "tx" no final
  
	generic (
--		N  : natural := 4 
	);
	
	port(
		--------------in--------------
		clk_tx         : in std_logic;
		rst_tx         : in std_logic;
		load_tx        : in std_logic;
		sel_paridade_tx: in std_logic;
		sel_baudrate_tx: in std_logic_vector(1 downto 0);
		--------------out--------------
		out_tx         : out std_logic_vector(10 downto 0);--
		ssd_tx         : out std_logic_vector(6 downto 0); --
		baudrate_tx    : out std_logic;                    -- Essa eh a saida de 'clock'para a placa de recepcao
		led_baudrate_tx: out std_logic_vector(3 downto 0)  -- Indica qual dos 4 baudrates esta selecionado
	);
	
end entity;
--------------------------------------------------------
architecture ifsc of tx_serial is
	signal tmp1: std_logic_vector(6 downto 0); -- Passa o caractere em ASCII para o "Conversor para serial"
	signal tmp2: std_logic;                    -- Passa o clock ja "Dividivo" para o baudrate escolhido
begin
 	
end architecture;
--------------------------------------------------------



