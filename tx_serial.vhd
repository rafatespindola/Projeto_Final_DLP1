library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
--------------------------------------------------------
entity tx_serial is -- Entradas e saidas com "tx" no final
  
	generic (
		N  : natural := 4 
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
	
	component gera_baudrate
		generic
		(N: integer := 4);
		port(
			--------------in--------------
			clk_gbd         : in  std_logic;                    -- clock de 50M
			sel_baudrate_gbd: in  std_logic_vector(1 downto 0); -- chaves H selecionam o baudrate desejado. (4 possibilidades) 
			--------------out--------------
			baudrate_gbd    : out std_logic;
			led_baudrate_gbd: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component conv_paralelo_serial
		generic (N: integer := 4);
		port(
			--------------in--------------
			clk_conv     : in std_logic;							-- clock de 50M
			load_conv    : in std_logic; 							-- button para carregar a palavra ao conversor paralelo serial
			ascii_conv   : in std_logic_vector(6 downto 0); -- caractere em ASCII chegando  
			baudrate_conv: in std_logic;                    -- clock ja convertido para o baudrate selecionado
			--------------out--------------
			out_ent      : out std_logic                    -- Saida com o caractere e mais os bits de controle. No total 11 bits por caractere
		);
	
	end component;
	
	component entrada
		generic(N: natural:= 8);
		port(
			--------------in--------------
			clk_ent  : in  std_logic;
			load_ent : in  std_logic; -- button para carregar a palavra ao conversor serial
			msg : in String := "teste123";
			--------------out--------------
			ssd1_ent : out std_logic_vector(6 downto 0); -- Primeiro display
			ssd2_ent : out std_logic_vector(6 downto 0); -- Segundo  display
			ssd3_ent : out std_logic_vector(6 downto 0); -- Terceiro display
			ssd4_ent : out std_logic_vector(6 downto 0); -- Quarto   display
			ssd5_ent : out std_logic_vector(6 downto 0); -- Quinto   display
			ssd6_ent : out std_logic_vector(6 downto 0); -- Sexto    display
			ssd7_ent : out std_logic_vector(6 downto 0); -- Setimo   display
			ssd8_ent : out std_logic_vector(6 downto 0); -- Oitavo   display
			load_out_ent : out std_logic_vector(6 downto 0) -- Saida para conversor serial apos traducao
		);
	
	end component;

begin
 	
		
end architecture;
--------------------------------------------------------



