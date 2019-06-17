library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
--------------------------------------------------------
entity entrada is -- Entradas e saidas com "ent" no final
  
	generic (
--		str  : tipo_caratere := "Abracadabra" 
	);
	
	port(
		--------------in--------------
		clk_ent  : in  std_logic;
		load_ent : in  std_logic; -- button para carregar a palavra ao conversor serial
		--------------out--------------
		ssd1_ent : out std_logic_vector(6 downto 0); -- Primeiro display
		ssd2_ent : out std_logic_vector(6 downto 0); -- Segundo  display
		ssd3_ent : out std_logic_vector(6 downto 0); -- Terceiro display
		ssd4_ent : out std_logic_vector(6 downto 0); -- Quarto   display
		ssd5_ent : out std_logic_vector(6 downto 0); -- Quinto   display
		ssd6_ent : out std_logic_vector(6 downto 0); -- Sexto    display
		ssd7_ent : out std_logic_vector(6 downto 0); -- Setimo   display
		ssd8_ent : out std_logic_vector(6 downto 0); -- Oitavo   display	
		ascii_ent: out std_logic_vector(6 downto 0)  -- Caractere unico traduzido para ASCII
	);
	
end entity;
--------------------------------------------------------
architecture ifsc of entrada is
	
begin
 	
end architecture;
--------------------------------------------------------



