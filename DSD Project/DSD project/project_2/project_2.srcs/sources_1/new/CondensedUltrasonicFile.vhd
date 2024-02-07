library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity HCRS04 is --Ultrasonic Sensor
    Port(
        clk : in  STD_LOGIC;
        echo : in  STD_LOGIC;
        RedState : in STD_LOGIC;
        Trigger : in  STD_LOGIC;
        Buzz: out STD_LOGIC
        );
end HCRS04;

architecture Behavioral of HCRS04 is

    COMPONENT Counter
        PORT(
            clk : IN std_logic;
            reset : IN std_logic;
            enable : IN std_logic;          
            q : OUT std_logic_vector(24 downto 0)
            );
    END COMPONENT;
        
    COMPONENT BuzzerCtrl
         Port(
            clk : in STD_LOGIC;
            echo_count : in STD_LOGIC_VECTOR (24 downto 0);
            echo : in STD_LOGIC;
            RedState : in STD_LOGIC;
            buzz : out STD_LOGIC
            );
    END COMPONENT;
    
    component BuzzTimeCounter
        Port ( clk : in STD_LOGIC;
               Buzz_In : in STD_LOGIC;
               Buzz_Out : out STD_LOGIC
               );
    end component;
    
    signal echo_count : STD_LOGIC_VECTOR (24 downto 0);
    signal BuzzSignal : STD_LOGIC;

begin

Inst_Counter: Counter PORT MAP(
            clk => clk,
            reset => Trigger,
            enable => echo,
            q => echo_count 
        );
    
Inst_BuzzerCtrl: BuzzerCtrl PORT MAP(  
            clk => clk,
            echo_count => echo_count,
            echo => echo,
            RedState => RedState,
            buzz => BuzzSignal
        );
     
Inst_BuzzTimeCounter: BuzzTimeCounter port map(
            clk => clk,
            Buzz_In => BuzzSignal,
            Buzz_Out => Buzz
        );
        
end Behavioral;

