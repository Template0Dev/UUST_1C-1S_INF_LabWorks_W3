function complete_by_newton_method(maxterm, infinium)
    printf('Вычисление методом Ньютона-Лейбница:\n');

    result = integrated_function(maxterm) - integrated_function(infinium);
    printf('\tРезультат: %1.5f.\n', result);
endfunction

function result = integrated_function(x)
    result = 4 / log(10) * 10 ^ (x / 4) + (cos(%pi * x) / %pi);
endfunction

function complete_by_stored_function(maxterm, infinium)
    printf('Вычисление через SciLab:\n');

    result = intg(infinium, maxterm, original_function);
    printf('\tРезультат: %1.5f.\n', result);
endfunction

function result = original_function(x)
    result = 10 ^ (x / 4) - sin(%pi * x)
endfunction

maxterm = 2;
infinium = -2;

complete_by_newton_method(maxterm, infinium);
complete_by_stored_function(maxterm, infinium);
