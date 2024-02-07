library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Lcd_controller is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           rs : out STD_LOGIC;
           e : out STD_LOGIC;
           lcd_data : out STD_LOGIC_VECTOR (7 downto 0));
end Lcd_controller;

architecture Behavioral of Lcd_controller is
type state_type IS (Power_up,Init,Ready,Send);
signal state : state_type ;
signal enable : std_logic := '0' ;
signal lcd_bus : std_logic_vector(9 downto 0) ;
signal Busy :  STD_LOGIC;
constant freq : INTEGER := 100 ;
constant rw : std_logic := '0' ;
begin

init_process : 
process(clk) 
Variable timing : INTEGER := 0 ;
begin 
    if(rising_edge(clk)) then 
        
        case state is 
        when Power_up => 
            --Wait 50ms for powerup.
            if(timing < (50000*freq)) then 
                timing := timing + 1 ;
                state <= Power_up ;
            else 
                timing := 0 ;
                rs <= '0' ;
                state <= Init ;
            end if ;
        when Init => 
            timing := timing +1 ;
            if(timing < (10*freq)) then  --Function_Set (8_Bit Mode) .
                lcd_data <= "00111000" ;
                e <= '1' ;
                state <= Init ;
            elsif( timing < (60*freq)) then -- Wait 50 us for Function Set.
                lcd_data <= "00000000" ;
                e <= '0' ;
                state <= Init ;
            elsif( timing < (70*freq)) then --Set the Display, Cursor, Blinking OFF.
                lcd_data <= "00001100" ;
                e <= '1' ;
                state <= Init ;
            elsif(timing < (120*freq)) then --Wait 50 us For the Display ON/OFF setUp.
                lcd_data <= "00000000" ;
                e <= '0' ;
                state  <= Init ;
            elsif( timing < (130*freq)) then --Display Clear.
                lcd_data <= "00000001" ;
                e <= '1' ;
                state <= Init ;
            elsif( timing < (2130 *freq)) then -- Wait 2ms For Display_Clear.
                lcd_data <= "00000000" ;
                e <= '0' ;
                state <= Init ;
            elsif( timing < (2140*freq)) then --Entry Mode Setting(Cursor moves to the right on new entry) .
                lcd_data <= "00000110" ;
                e <= '1' ;
                state <= Init ;
            elsif( timing < (2200*freq)) then --Wait 60us for the Entry Mode Setting.
                lcd_data <= "00000000" ;
                e <= '0' ;
                state <= Init ;
            else     
                timing := 0 ;
                state <= Ready ;
            end if ;
        
        when Ready => 
            if(enable = '1') then 
                Busy <= '1' ;
                rs <= lcd_bus(9) ;
                lcd_data <= lcd_bus(7 downto 0);
                timing := 0 ;
                state <= Send ;
            else
                Busy <= '0' ;
                rs <= '0' ;
                lcd_data <= "00000000" ;
                timing := 0 ;
                state <= Ready ;
            end if ;
            
        when Send => 
            --Generating The pulsed_latch (The processor of the lcd understands that the instruction(Data) is ready to be recieved).
            if( timing <( 50*freq)) then -- time for pulse is 50us.
                if(timing < freq) then 
                    e <= '0' ;
                elsif( timing < (14*freq)) then  -- wait half cycle.
                    e <= '1';
                elsif( timing < (28*freq)) then -- wait the second half.
                    e <= '0' ;
                end if ;
                timing := timing +1 ;
                state <= Send ;
            else
                timing := 0 ;
                state <= Ready ;
            end if; 
        end case ;
    end if ;
 
end process ;

Data_process : 
process(clk) 
variable data_character : INTEGER range -1 to 17 := -1 ;
begin 
    if(rising_edge(clk)) then 
        if(state = Ready and enable = '0' and Busy = '0') then 
            enable <= '1' ;
            
            if(data_character < 17) then 
                data_character := data_character+1;
            end if ;
            case data_character is 
                when 0 =>  lcd_bus <= "1001000010" ; -- Aski for letter B
                when 1 =>lcd_bus <= "1001000001" ;  -- Aski for letter A
                when 2 => lcd_bus <= "1001010011" ;   -- Aski for letter S
                when 3 => lcd_bus <= "1001011001" ;-- Aski for letter Y
                when 4 => lcd_bus <= "1001010011" ;-- Aski for letter S
                when 5 => lcd_bus <= "1001011111" ;-- Aski for space
                when 6 => lcd_bus <= "1001001101" ;-- Aski for letter M
                when 7 => lcd_bus <= "1001000101" ;-- Aski for letter E
                when 8 => lcd_bus <= "1001001110" ;-- Aski for letter N
                when 9 => lcd_bus <= "1001011111" ;-- Aski for space
                when 10=>  lcd_bus <= "0011000000" ; -- command to write on line 2.
                when 11 => lcd_bus <= "1001000001" ;  -- Aski for letter A
                when 12 => lcd_bus <= "1001001100" ;-- Aski for letter L
                when 13 => lcd_bus <= "1001000001" ;-- Aski for letter A
                when 14 => lcd_bus <= "1001001101" ;-- Aski for letter M
                when 15 => lcd_bus <= "1001000001" ;-- Aski for letter A
                when 16 => lcd_bus <= "1001001100" ;-- Aski for letter L
                when others => enable <= '0' ;
            end case ;
            else 
            enable <= '0' ;
        end if; 
    end if ;
end process ;

 

end Behavioral;
