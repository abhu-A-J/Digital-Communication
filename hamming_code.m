function hamming_code(input,error_input)

l=length(input);
data=zeros(l/4,4);

start=1;
ending=l/4;
codeword=zeros(l/4,l/4+3);

%%%%%%%%%%%%Split the data in parts of 4 %%%%%%%%%%%%%
for i=1:1:l/4
    data(i,:)=input(start:ending);
    start=ending+1;
    ending=ending+(l/4);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Parity extension setup %%%%%%%%%%%%%%%%
for i=1:l/4
    for j=1:l/4+3
        if( j>l/4)
            codeword(i,j)=0;
        else
            codeword(i,j)=data(i,j);
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%Finding the correct parity /redudancy%%%%%%%%%%%%%%%
[m,n]=size(codeword);
for i=1:m
    for j=l/4+1:n
        r0=codeword(i,2)+codeword(i,3)+codeword(i,4);
        r1=codeword(i,1)+codeword(i,2)+codeword(i,3);
        r2=codeword(i,3)+codeword(i,4)+codeword(i,1);
        r0=mod(r0,2);
        r1=mod(r1,2);
        r2=mod(r2,2);
        r=[r0 r1 r2];
        codeword(i,j)=r(j-4);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Generating the codeword as bit stream%%%%%%%%%%%%%
k=1;
for i=1:m
    for j=1:n
        codeword_stream(k)=codeword(i,j);
        k=k+1;
    end
end

disp('The codeword in matrix form is:');
disp(codeword);

L=length(codeword_stream);
disp('The codeword bit stream is given by:');
disp(codeword_stream);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% ERROR PART-CHANNEL SIDE%%%%%%%%%%%%%%%%%%%%%%%%
len_error=length(error_input);
disp('Error Input is:');
disp(error_input);
error_stream=zeros(1,len_error);

for i=1:L
    val=codeword_stream(i)+error_input(i);
    error_stream(i)=mod(val,2);
end

%error_stream
txd_side(error_stream);





            