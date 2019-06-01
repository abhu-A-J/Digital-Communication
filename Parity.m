function parity=Parity(input)
[m1,n1]=size(input);

sum_rows=zeros(m1,1);
sum_columns=zeros(1,n1);

%calculate row parity
for i=1:m1
    for j=1:n1
        sum_rows(i,1)=sum_rows(i,1)+input(i,j);
    end

end
for i=1:m1
    sum_rows(i,1)=mod(sum_rows(i,1),2);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%calculate the column parity
for i=1:n1
    for j=1:m1
        sum_columns(1,i)=sum_columns(1,i)+input(j,i);
    end
end
for i=1:n1
     sum_columns(1,i)=mod(sum_columns(1,i),2);
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
last_p_bit=0;
for i=1:m1
    last_p_bit=last_p_bit+sum_columns(1,i);
end
last_p_bit=mod(last_p_bit,2);
parity=[sum_rows' sum_columns last_p_bit]