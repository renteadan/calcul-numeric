
a();
b();

function a()
    A = [10 7 8 7; 7 5 6 5; 8 6 10 9; 7 5 9 10];
    B = [32; 23; 33; 31];
    xe = A\B;

    B2 = [32.1; 22.9; 33.1; 30.9];
    xep = A\B2;
    err_in = norm(B-B2)/norm(B);
    err_out = norm(xep-xe)/norm(xe);
    err_raport=err_out/err_in;
    con=cond(A);
    fprintf("A).\nEroare intrare: %d\nEroare iesire: %d\nRaport erori: %d\nNumarul de conditionare: %d\n", err_in, err_out, err_raport, con);
end

function b()
    A = [10 7 8 7; 7 5 6 5; 8 6 10 9; 7 5 9 10];
    A2 = [10 7 8.1 7.2; 7.08 5.04 6 5; 8 5.98 9.89 9; 6.99 4.99 9 9.98];
    B = [32; 23; 33; 31];
    xe = A\B;

    xep = A2\B;
    err_in = norm(A-A2)/norm(A);
    err_out = norm(xep-xe)/norm(xe);
    err_raport=err_out/err_in;
    con=cond(A);
    fprintf("B).\nEroare intrare: %d\nEroare iesire: %d\nRaport erori: %d\nNumarul de conditionare: %d\n", err_in, err_out, err_raport, con);
end