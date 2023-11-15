Digital Combination lock

<!-- First Section -->
## Team Details
<details>
  <summary>Detail</summary>

  > Semester: 3rd Sem B. Tech. CSE

  > Section: S1

  > Member-1: kumaara ganapathi n, 221cs133, kumaaraganapathin@nitk.edu.in

  > member-2: shishir ashok, 221cs152, shishirashok.221cs152@nitk.edu.in

  > Member-3: tarun tamanda kumar, 221cs158, tamadatarunkumar.221cs158@nitk.edu.in
</details>

<!-- Second Section -->
## Abstract
<details>
  <summary>Detail</summary>
  
Background and Motivation:
The increasing rate of crime, attacks by thieves, intruders, and vandals,
despite all forms of security gadgets and locks still need the attention of
researchers to find a permanent solution to the well-being of lives and
properties of individuals. To this end, we design a cheap and effective
security system for buildings, cars, safes, doors and gates, so as to prevent
an unauthorized person from having access to one's properties through the
use of codes, we, therefore, experiment the application of electronic
devices as locks
This project uses shift registers and LEDs to indicate the locking and
unlocking process. The project is open source as we are a group of open
source enthusiasts, and our project is readily and available and modifiable
through our GitHub page. The project can also be easily converted to a
satellite-based otp enable locking system too, which we would be working
on during the hardware implementation.
Unique contributions:
As mentioned our main goal is to make a cost-effective security system. Our
primary motive is to considerably lower the cost of personal security and
privacy by effectively implementing logic gates and digital systems.
BRIEF DESCRIPTON:
As mentioned previously, our primary aim for this project was to create a
cheap and effective lock. To achieve this motive, we started researching
various pre-existing designs. We discovered many projects, ranging from
basic to industry level. However, the more complex ones seemed ludicrous
and difficult to implement in a cost-effective manner. Also, a lot of these
ideas were quite laborious to comprehend and were difficult to implement
with our basic understanding of the intricacies of this vast subject. We came
up with a good foundational project, with a 1-bit lock, using a flip-flop to
store the inputted value, and a simple X-Or gate to compare against the
previous password. Then we implemented a decimal to binary encoder, to
enable us to input passwords in the decimal system. Soon we expanded to
4-digit passwords. We faced a lot of difficulties while implementing this
encoder as we initially came up with complex designs that weren’t feasible.
Then the next hurdle was how to implement this using one number pad,
with a little help from the ever-helpful lab assistants of NITK, we were able
to cross this hurdle too.
Here are some key features of our project-
1. Decimal-to-Binary Conversion: The heart of our Digital Combination Lock
lies in its use of encoders, which expertly convert decimal inputs into binary.
This transformation is a critical aspect of its operation, ensuring secure and
precise communication between the user and the system.
2. Enhanced Security: By utilizing a binary code, the lock offers a higher level
of security compared to traditional locks. This digitized approach makes it
exceptionally challenging for unauthorized individuals to breach the system.
3. User-Friendly Interface: While the technology behind this lock is highly
advanced, the user interface is designed to be intuitive and straightforward.
Users can input their combinations easily and quickly, making access
convenient without compromising security.
4. Shift Registers: The incorporation of shift registers adds another layer of
complexity to the locking mechanism. These registers store and manipulate
the binary code, enhancing security by requiring a specific sequence to
unlock.
5. Magnitude Comparators: To validate the input sequence, our Digital
Combination Lock uses magnitude comparators. This component plays a
pivotal role in determining whether the input matches the predefined
combination, ensuring accurate and reliable access control.
6. Customizable Combinations: Users have the flexibility to set their own
unique combinations, increasing the adaptability and personalization of the
lock.
7. Robust and Reliable: The lock system has been engineered to be highly
durable and reliable, ensuring long-term use without frequent
maintenance.
8. Applications: This Digital Combination Lock can find applications in
various fields, including home security, office access control, and even
industrial facilities where a high level of security is required.
9. Future Expansion: The architecture of this lock is designed with future
expansion in mind. It can be integrated with additional security features or
connected to a broader security network for comprehensive protection.it
can be easily converted to a satellite based opt locking similar to that of an
authenticator designed by IBM or Intuit.
</details>

<!-- Third Section -->
## Working
<details>
  <summary>Detail</summary>

  > Explain the working of your model with the help of a functional table (compulsory) followed by the flowchart.
</details>

<!-- Fourth Section -->
## Logisim Circuit Diagram
<details>
  <summary>Detail</summary>

  ![image](https://github.com/kumaarakg/t21-dds-mini-project/blob/main/circuit%20diagram.png)
</details>

<!-- Fifth Section -->
## Verilog Code
<details>
  <summary>Detail</summary>

    ````
    module fourbitcomparator(a,b,eq1);
    input [3:0]a,b;
    output eq1;
    wire w1,w2,w3,w4,w5,w6;
    //Gate Level
    xnor(w1,a[0],b[0]);
    xnor(w2,a[1],b[1]);
    xnor(w3,a[2],b[2]);
    xnor(w4,a[3],b[3]);
    and(w5,w1,w2);
    and(w6,w3,w4);
    and(eq1,w5,w6);


endmodule

module encoder(i,y);
    input [9:0]i;
    output [3:0]y;
    
    or o1(y[3],i[9],i[8]);
    or o2(y[2],i[7],i[6],i[5],i[4]);
    or o3(y[1],i[7],i[6],i[3],i[2]);
    or o4(y[0],i[9],i[7],i[5],i[3],i[1]);
endmodule








module lock(a1,a2,a3,a4,locki);


    
    
    input [9:0]a1;
    input [9:0]a2;
    input [9:0]a3;
    input [9:0]a4;
    output locki;


    
    
    wire [3:0]digi1;
    wire [3:0]digi2;
    wire [3:0]digi3;
    wire [3:0]digi4;
    encoder o1(a1,digi1);
    encoder o2(a2,digi2);
    encoder o3(a3,digi3);
    encoder o4(a4,digi4);
    wire [3:0] pass1;
    assign pass1=4'b0000;
    
    wire [3:0] pass2;
    assign pass2=4'b1001;
    
    wire [3:0] pass3;
    assign pass3=4'b0011;
    
    wire [3:0] pass4;
    assign pass4=4'b0001;
    wire temp1,temp2,temp3,temp4;
    fourbitcomparator g1(pass1,digi1,temp1);
    fourbitcomparator g2(pass2,digi2,temp2);
    fourbitcomparator g3(pass3,digi3,temp3);
    fourbitcomparator g4(pass4,digi4,temp4);
    and g5(locki,temp1,temp2,temp3,temp4);
    endmodule



    





    ````
</details>



