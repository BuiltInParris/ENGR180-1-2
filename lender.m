function[D, M] = lender(P, D, S, T)
  % provide your answer as a function here. 
  % for your input parameters, follow the order they were given above. (P, D, S, T)
  % for the output parameters, provide the decision first, then the monthly payment.
M = 0;

if(S < 650)
D = "no";
end

if((650 <= S <= 699) && (D => P/5))
D = "yes";
Loan = P - D;
M = Loan/T;
end

if(S > 700)
D = "yes;
end

end