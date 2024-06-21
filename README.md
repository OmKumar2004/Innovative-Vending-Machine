# Innovative-Vending-Machine

This is the code for a new innovative idea of Vending Machine.

My Youtube Video Link for better overview: https://youtu.be/Ni-z2QnxkHY?feature=shared

Working of this Vending Machine
- Customer can select items and put money of different dinominations simultaneously
- There is no restriction that first you need to select items and than pay money.
- The value of money will be visible to the customer with the help of leds present on the RPI Module.
- The sign of money is shown with the help of a RGB Led.
- The item count will also be visible to the person with the help of two 7- segment displays.
- So, person selects items and put money than he/she can again select any item and put money.
- Then customer will pull the start lever up which will only give the items out of the machine if the total money input <= total cost of items otherwise there will be no action (if customer has put any money then that will also be in the machine only)
- Customer may add more money or if he want, can also cancel the transaction (there is a slide switch on RPI, pulling it up will cancel the transaction)
- If customer cancels the transaction then the item count on the 7-segment dispaly will came down to 0 and also all the money will came out of the machine and the money value will also come down to 0.


Functionalites which can be made better but I can't able to do so because of limitations of resources:
- I don't have access to the LED display and more 7-segment displays due to which the money value is shown in binary with the help of LEDs on the RPI module. Because of this only I have taken value of items very less and also the denominations as less.
- Also as there are very limited amount of buttons, I have to use slide switches for reset, start and cancel but it would be better if these functionalities are done with the help of button as button after pressing autometically comes to its original position but the slide switch need to be pulled down.


This is made using:
- XILINX PYNQ Z2 Board
- RPI Addon module
- Two Seven Segment Displays
- Breadboard and Wires
