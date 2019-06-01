function txd_side(input)

l=length(input);
codeword=zeros(4,l/4);

start=1;
ending=l/4;

%%%%%%%%%%%%% MAKING 2-D Matrix for the codeword %%%%%%%%%%%%%
for i=1:1:l/7
    codeword(i,:)=input(start:ending);
    start=ending+1;
    ending=ending+(l/4);
end
[m,n]=size(codeword);
syndrome=zeros(l/7,3); %length of 4,3
%%%%%%%%%%%%%%%%%% Syndrome calculation %%%%%%%%%%%%%%%%
for i=1:m
    for j=l/7+1:n
        s0=codeword(i,2)+codeword(i,3)+codeword(i,4)+codeword(i,5);
        s1=codeword(i,1)+codeword(i,2)+codeword(i,3)+codeword(i,6);
        s2=codeword(i,3)+codeword(i,4)+codeword(i,1)+codeword(i,7);
        s0=mod(s0,2);
        s1=mod(s1,2);
        s2=mod(s2,2);
        s=[s2 s1 s0];
        syndrome(i,j-4)=s(j-4);
        
       
    end
end
[m,n]=size(syndrome);
correct_code=codeword;

for i=1:m
    
    if( (syndrome(i,1)==0) && (syndrome(i,2)==0) && (syndrome(i,3)==1) )
        correct_code(i,5)=~codeword(i,5);
    end
    
    if( (syndrome(i,1)==0) && (syndrome(i,2)==1) && (syndrome(i,3)==0) )
        correct_code(i,6)=~codeword(i,6);
    end
    
    if( (syndrome(i,1)==0) && (syndrome(i,2)==1) && (syndrome(i,3)==1) )
        correct_code(i,2)=~codeword(i,2);
    end
    
    if( (syndrome(i,1)==1) && (syndrome(i,2)==0) && (syndrome(i,3)==0) )
        correct_code(i,7)=~codeword(i,7);
    end
    
    if( (syndrome(i,1)==1) && (syndrome(i,2)==0) && (syndrome(i,3)==1) )
        correct_code(i,4)=~codeword(i,4);
    end
    
    if( (syndrome(i,1)==1) && (syndrome(i,2)==1) && (syndrome(i,3)==0) )
        correct_code(i,1)=~codeword(i,1);
    end   
    
    if( (syndrome(i,1)==1) && (syndrome(i,2)==1) && (syndrome(i,3)==1) )
        correct_code(i,3)=~codeword(i,3);
    end    
      
end
 correct_code %4*7 matrix
 [m,n]=size(correct_code);
 
 k=1;   
data_corrected=zeros(1,(l/7*4));   
    for i=1:m
       for j=1:l/7
           data_corrected(1,k)=correct_code(i,j);
           k=k+1;
       end
    end   
 disp('Corrected data stream is:');
  disp(data_corrected);

    
        
