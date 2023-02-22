function v = fisherLinearDiscriminant(X1, X2)

    m1 = size(X1, 1);
    m2 = size(X2, 1);
    
    samples = (size(X1,1) * size(X1,2)) + (size(X2,1) * size(X2,2));
    
    mu1 = mean(X1);% mean value of X1
    mu2 = mean(X2);% mean value of X2

    S1 = cov(X1);% scatter matrix of X1
    S2 = cov(X2);% scatter matrix of X2
    
    P1 = (size(X1,1) * size(X1,2))/samples;
    P2 = (size(X2,1) * size(X2,2))/samples;
    
    Sw =(P1.*S1+P2.*S2)/2;  % Within class scatter matrix
    
    Sw_inv = inv(Sw);
    v =  Sw_inv*(mu1-mu2)';% optimal direction for maximum class separation 

    v = v/norm(v);% return a vector of unit norm
