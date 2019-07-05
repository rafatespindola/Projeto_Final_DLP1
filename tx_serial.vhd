library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
--------------------------------------------------------
entity tx_serial is 											      -- Entradas e saidas com "tx" no final
  
	generic (N  : natural := 4);

	port(
		--------------in--------------
		clk_tx          : in std_logic;
		rst_tx          : in std_logic;
		enable_tx       : in std_logic;
		load_tx         : in std_logic;  
		sel_paridade_tx : in std_logic;
		sel_baudrate_tx : in std_logic_vector(1 downto 0);
		--------------out--------------
		out_tx          : out std_logic;-- Saida com os 11 bits em serie 1 por vez
		ssd1_tx         : out std_logic_vector(6 downto 0); -- Primeiro display
		ssd2_tx         : out std_logic_vector(6 downto 0); -- Segundo  display
		ssd3_tx         : out std_logic_vector(6 downto 0); -- Terceiro display
		ssd4_tx         : out std_logic_vector(6 downto 0); -- Quarto   display
		ssd5_tx         : out std_logic_vector(6 downto 0); -- Quinto   display
		ssd6_tx         : out std_logic_vector(6 downto 0); -- Sexto    display
		ssd7_tx         : out std_logic_vector(6 downto 0); -- Setimo   display
		ssd8_tx         : out std_logic_vector(6 downto 0); -- Oitavo   display
		baudrate_tx     : out std_logic;  			          -- Essa eh a saida de 'clock'para a placa de recepcao
		led_baudrate_tx1: out std_logic;                    -- Baudrate 9600
		led_baudrate_tx2: out std_logic;                    -- Baudrate 1
		led_baudrate_tx3: out std_logic;                    -- Baudrate 1/2
		led_baudrate_tx4: out std_logic                     -- Baudrate 1/4
	);
	
end entity;
--------------------------------------------------------
architecture ifsc of tx_serial is
	--signal tmp1: std_logic_vector(6 downto 0);             -- Passa o caractere em ASCII para o "Conversor para serial"
	--signal tmp2: std_logic;                                -- Passa o clock ja "Dividivo" para o baudrate escolhido
	
	component gera_baudrate
		port(
			--------------in--------------
			clk_gbd          : in  std_logic;                   -- clock de 50M
			rst_gbd          : in  std_logic;
			sel_baudrate_gbd : in  std_logic_vector(1 downto 0);-- Escolhe baudrate (4 possibilidades) 
			--------------out--------------
			baudrate_gbd     : out std_logic;
			led_baudrate_gbd1: out std_logic;
			led_baudrate_gbd2: out std_logic;
			led_baudrate_gbd3: out std_logic;
			led_baudrate_gbd4: out std_logic
		);
	end component;
	
	component conv_paralelo_serial
		generic (N: integer := 4);
		port(
			--------------in--------------
			sel_par_conv: in std_logic;
			load_conv   : in  std_logic;
			clk_conv, rst_conv    : in std_logic;
			ascii_conv  : in std_logic_vector(6 downto 0); -- caractere em ASCII chegando  
			--------------out--------------
			out_conv    : out std_logic-- Saida com o caractere e mais os bits de controle. No total 11 bits por caractere
		);
	end component;
	
	component entrada
		generic(N: natural:= 8);
		port(
			--------------in--------------
			clk_ent    : in  std_logic;
			enable_ent: in  std_logic;                      -- button para carregar a palavra ao conversor serial
			load_ent: in std_logic;
			msg        : in  String := "dLP12345";
			--------------out--------------
			ssd1_ent : out std_logic_vector(6 downto 0);   -- Primeiro display
			ssd2_ent : out std_logic_vector(6 downto 0);   -- Segundo  display
			ssd3_ent : out std_logic_vector(6 downto 0);   -- Terceiro display
			ssd4_ent : out std_logic_vector(6 downto 0);   -- Quarto   display
			ssd5_ent : out std_logic_vector(6 downto 0);   -- Quinto   display
			ssd6_ent : out std_logic_vector(6 downto 0);   -- Sexto    display
			ssd7_ent : out std_logic_vector(6 downto 0);   -- Setimo   display
			ssd8_ent : out std_logic_vector(6 downto 0);   -- Oitavo   display
			load_out_ent : out std_logic_vector(6 downto 0)-- Saida para conversor serial apos traducao
		);
	end component;

	signal to_conv : std_logic_vector(6 downto 0);
	signal clk_baud: std_logic;
	
begin

	ent : entrada
		generic map(N=> 8)
		port map(clk_ent => clk_baud, enable_ent => enable_tx, load_ent => load_tx, msg => "dLP12345", ssd1_ent => ssd1_tx, ssd2_ent => ssd2_tx, ssd3_ent => ssd3_tx, ssd4_ent => ssd4_tx, ssd5_ent => ssd5_tx, ssd6_ent => ssd6_tx, ssd7_ent => ssd7_tx, ssd8_ent => ssd8_tx, load_out_ent => to_conv);
	
	conv: conv_paralelo_serial
		generic map(N=> 4)
		port map(sel_par_conv => sel_paridade_tx, load_conv => load_tx, clk_conv => clk_baud, rst_conv => rst_tx, ascii_conv => to_conv, out_conv => out_tx);

	gdb : gera_baudrate
		port map(clk_gbd => clk_tx, rst_gbd => rst_tx, sel_baudrate_gbd => sel_baudrate_tx, baudrate_gbd => clk_baud, led_baudrate_gbd1 => led_baudrate_tx1, led_baudrate_gbd2 => led_baudrate_tx2, led_baudrate_gbd3 => led_baudrate_tx3, led_baudrate_gbd4 => led_baudrate_tx4);

	baudrate_tx <= clk_baud;
	
	
	
end architecture;
--------------------------------------------------------



