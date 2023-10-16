// X and Y are sets of coordinates, to build the plot.
function build_final_plot(x, y)
    // Build the plot by sent coordinates.
    plot(x, y);
    
    xgrid(); // Add grid to the built plot.
    xtitle('Функция Y=2*Cos^2(X) + 5*Sin(X)+1', 'X', 'Y'); // Add titles to plot.

    a = gca();
    a.x_location = 'origin';
    a.y_location = 'origin';
endfunction

// Function to calculate 'Y' plot coordinate.
function result = calculate_equation(number)
    result = 2 * (cos(number) ^ 2) + 5 * sin(number) + 1;
endfunction

function build_polynom()
    // Create the vector from the original equaltion (should be written in reverse order).
    vector = [1 5 2 0 0];
    // Create polynom from the vector (with 'X' as variable, and coefficients as results ('c' as third argument)).
    polynom = poly(vector, 'x', 'c');
    // Then just find the roots of the equation.
    results = roots(polynom);

    // Show final results (roots).
    printf('\nКоличество найденных корней: %d.\n', length(results));
    for i = 1:length(results)
        printf('\tКорень %d: %1.5f.\n', i, results(i));
    end
endfunction

function solve_transcendent_equation()
    results(1) = fsolve(3.5, calculate_equation);
    results(2) = fsolve(5.5, calculate_equation);

    printf('\nНайденные корни:\n');
    for i = 1:length(results)
        printf('\tКорень X(%d): %1.10f.\n', i, results(i));
    end
endfunction

// This generates original coordinates sets.
x_coordinates_set = 0:0.5:6; 
y_coordinates_set = x_coordinates_set;
for i = 1:length(y_coordinates_set)
    // Cycle to iterate 'Y' coordinates and calculate them.
    y_coordinates_set(i) = calculate_equation(y_coordinates_set(i));
end

// Lets show the final coordinate values.
printf('Значения координат:\n');
for i = 1:length(y_coordinates_set)
    printf('%1.2f', x_coordinates_set(i));
    printf(';   ');

    printf('%1.2f', y_coordinates_set(i));
    printf('.\n');
end

// And then, we solve the equation and build the plot.
solve_transcendent_equation();
build_final_plot(x_coordinates_set, y_coordinates_set);
