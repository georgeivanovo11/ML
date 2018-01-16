Octave:

== %equals
~= %not equals

disp(a); %show on the console
disp(sprintf('2 decimals: %0.2f', a)); 

format long %3.1416322344
format short %3.1416

A = [1 2; 3 4; 5 6]; %matrix
V = [1; 2; 3]; %vector
B = 1:0.2:2; %[1 1.2 1.4 1.6 1.8 2]
I = ones(2,3); % [1 1 1; 1 1 1]
O = zeros(1,3); %[0 0 0]
R = rand(3,3); 
E = eye(4); %identity matrix

s = size(A); % [3 2]
s = size(A, 1); % 3
s = size(A, 2); % 2

pwd %shows the current directory
cd '...' %go to directory
ls %list of elemets in directory

load('featuresX.dat') %load data in variable featuresX
who %shows list of variables 
whos %shows detailed info about variables
clear A % delete from memory variable A

v = V(1:10); %set first 10 elemets of V to v
save hello.mat v; %save variable v in binary form
save hello.txt v -ascii; %save variable v in text form

A = [1 2; 3 4; 5 6]; 
A(3,2); % 6
% : means all elements
A(2,:); % [3 4]
A(:,2); % [2;4;6]
A(:,1:3);

A(:,2) = [10; 11; 12]; %assign vector
A = [A, [21; 22; 23]]; %append another column vector to right
A(:) % put all elemets of matrix in a single vector
C = [A B] %concatinate 2 matrix in horizontal direction
C = [A; B] %concatinate 2 matrix in vertical direction

C = A * B; %matrix multiplication
C = A .* B; %element-wise multiplication of two matrices
D = A .^ 2; %the element wise squaring of A
log(A), exp(A), abs(A)
A = A'; %transparation

A = [1 15 2 3];
val = max(A); %15
[val, ind] = max(A); %[15, 2]
A < 4; % [1 0 1 1]
ind = find(A < 4); % [1 3 4] -indexes of elements
B = [1 8 6;
	 3 4 9];
[r,c] = find(B > 7); % r=[1;2] c=[2;3] 

sum(A) %sum of element of vector
prod(A) % product of elemets of vector

a=0.5;
floor(a); %0
ceil(a); %1

A = [1 2; 3 4; 5 6]; 
max(A,[],1); %maxes per column 
max(A,[],2); %maxes per row
sum(A,1); %sum per column
sum(A,2); %sum per row
pinv(A); %identical matrix


t=[0:0.01:1];
y=sin(2*pi*4*t);
plot(t,y); 

%two plots on one plane on one figure
y1=sin(x);
y2=cos(x);
plot(x,y1);
hold on;
plot(x,y2,'r'); %red color
axis([0.5 1 -1 1]); %[mixX maxX minY maxY]
xlabel('time');
ylabel('value');
legend('sin','cos'); 
title('my plot');
print -dpng 'myPlot.png'; %save image
close 
clf; %clear figure

%two plots on different figures
figure(1); plot(t,y1);
figure(2); plot(t,y2);

%two plots on different planes on one figure
subplot(1,2,1); %divides figure on 1x2 grid, access first one
plot(x,y1);
subplot(1,2,2); % access second one
plot(x,y2);

A=magic(5);
imagesc(A);
imagesc(A), colorbar, colormap gray;


v=zeros(10,1);
for i=1:10,
	v(i)=2^i;
end;

i=1;
while i <= 5,
	v(i) = 100;
	i = i+1;
end;

i=1;
while true,
	v(i)=999;
	i=i+1;
	if i==6,
		break;
	end;
end;

if v(1)==1,
	disp('it is 1');
elseif v(1)==2,
	disp('it is 2');
else
	disp('it is not 1 or 2');
end;

*.m - octave_function
%define the function:
function y = squareThisNumber(x)
y = x^2;
%call the function:
cd 'path to directory';
squareThisNumber(5) %25

%define the function in file:
function [y1,y2] = squareAndCubeThisNumber(x)
y1 = x^2;
y2 = x^3;
%call the function:
[a,b] = squareAndCubeThisNumber(5);



























