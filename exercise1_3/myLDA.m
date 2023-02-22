function A = myLDA(Samples, Labels, NewDim)
% Input:    
%   Samples: The Data Samples 
%   Labels: The labels that correspond to the Samples
%   NewDim: The New Dimension of the Feature Vector after applying LDA

%     Testing Values
%     Samples= meas_norm;
%     Labels = iris_labels;
%     NewDim = 2;
    
    
    [NumSamples NumFeatures] = size(Samples);
	A=zeros(NumFeatures,NewDim);
    
	
    NumLabels = length(Labels);
    if(NumSamples ~= NumLabels) then
        fprintf('\nNumber of Samples are not the same with the Number of Labels.\n\n');
        exit
    end
    Classes = unique(Labels);
    NumClasses = length(Classes);  %The number of classes
    
    %Calculate the Global Mean
    m0=sum(Samples)*(1/NumClasses);
    
    
    
    %For each class i
	%Find the necessary statistics
    Sw = zeros(NewDim);
    for i=1:NumClasses
        %Calculate the Class Prior Probability
        ClassSamples = Samples(Labels==i-1,:);
        NumClass = size(ClassSamples,1);
        P(i)= NumClass/NumSamples;
        %Calculate the Class Mean 
        mu(i,:) = mean(ClassSamples(i,:));
    end
    
    %Calculate the Within Class Scatter Matrix
    Sw(i)= Sw(i) + sum(P(i) * cov(ClassSamples));
    %Calculate the Between Class Scatter Matrix
    Sb=Sb+P(i)*(mu-m0)*transpose(mu-m0);
    
    %Eigen matrix EigMat=inv(Sw)*Sb
    EigMat = inv(Sw)*Sb;
    
    %Perform Eigendecomposition

    
    %Select the NewDim eigenvectors corresponding to the top NewDim
    %eigenvalues (Assuming they are NewDim<=NumClasses-1)
	%% You need to return the following variable correctly.
	A=zeros(NumFeatures,NewDim);  % Return the LDA projection vectors
