LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- Generates a 16-bit signed triangle wave sequence at a sampling rate determined
-- by input clk and with a frequency of (clk*pitch)/65,536
ENTITY tone IS
	PORT (
		clk : IN STD_LOGIC; -- 48.8 kHz audio sampling clock
		pitch : IN UNSIGNED (13 DOWNTO 0); -- frequency (in units of 0.745 Hz)
		bt_square : IN STD_LOGIC;
	    data : OUT SIGNED (15 DOWNTO 0)); -- signed triangle wave out
END tone;

ARCHITECTURE Behavioral OF tone IS
	SIGNAL count : unsigned (15 DOWNTO 0); -- represents current phase of waveform
	SIGNAL quad : std_logic_vector (1 DOWNTO 0); -- current quadrant of phase
	SIGNAL index : signed (15 DOWNTO 0); -- index into current quadrant
	SIGNAL square : signed (15 DOWNTO 0);
BEGIN
	-- This process adds "pitch" to the current phase every sampling period. Generates
	-- an unsigned 16-bit sawtooth waveform. Frequency is determined by pitch. For
	-- example when pitch=1, then frequency will be 0.745 Hz. When pitch=16,384, frequency
	-- will be 12.2 kHz.

	cnt_pr : PROCESS
	BEGIN
		WAIT UNTIL rising_edge(clk);
		count <= count + pitch;
		if (count <= 65535/2) then
		square <= "0011111111111111";
		else
		square <= "1011111111111111";
		end if;
	END PROCESS;
	quad <= std_logic_vector (count (15 DOWNTO 14)); -- splits count range into 4 phases
	index <= signed ("00" & count (13 DOWNTO 0)); -- 14-bit index into the current phase
	-- This select statement converts an unsigned 16-bit sawtooth that ranges from 65,535
	-- into a signed 12-bit triangle wave that ranges from -16,383 to +16,383
    process (bt_square)
	begin
	if (bt_square = '0') then
	case quad is
	when "00" => data <= index;
	when "01" => data <= 16383 - index;
	when "10" => data <= 0 - index;
	when "11" => data <= index - 16383;
	end case;
	else
	data <= square;
	end if;
	end process;
END Behavioral;