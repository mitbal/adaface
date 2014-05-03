function h = g( fs, p, theta )
%function g act as weak classifier

    h = p .* fs < p*theta;

end

