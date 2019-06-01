function parity_checker(input,error_input)
p1=Parity(input);
p2=Parity(error_input);
disp('Input data:');
disp(input);
disp('Recieved data with/without error:');
disp(error_input);
if(p1==p2)
    disp('No Error in reception of data');
else
    disp('Error in reception of data.Send the data back');
end
disp('Error positions are indicated by value 1');
error_positions=abs(input-error_input)

