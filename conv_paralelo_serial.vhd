library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
--------------------------------------------------------
entity conv_paralelo_serial is -- Entradas e saidas com "conv" no final
  
	generic (
		N: integer := 4 
	);
	
	port(
		--------------in--------------
		clk_conv     : in std_logic;							-- clock de 50M
		load_conv    : in std_logic; 							-- button para carregar a palavra ao conversor paralelo serial
		ascii_conv   : in std_logic_vector(6 downto 0); -- palavra em formato ascii chegando  
		baudrate_conv: in std_logic;                    -- clock ja convertido para o baudrate selecionado
		--------------out--------------
		out_ent      : out std_logic                    -- Saida com o caractere e mais os bits de controle. No total 11 bits por caractere
	);
	
end entity;
--------------------------------------------------------
architecture ifsc of conv_paralelo_serial is
	
begin
 	
end architecture;
--------------------------------------------------------



