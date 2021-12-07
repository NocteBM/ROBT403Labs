L(1) = Revolute('d', 1, 'a', 0, 'alpha', pi/2, ...
    'I', [0, 0, 0], ...
    'r', [0, 0, 0.5], ...
    'm', 0, ...
    'Jm', 1e-4, ...
    'G', 500, ...
    'B', 10e-4, ...
    'Tc', 10e-4, ...
    'qlim', [-180 180]*rad_to_deg );

L(2) = Revolute('d', 0, 'a', 1, 'alpha', 0, ...
    'I', [0.0125, 0.83958, 0.83958], ...
    'r', [0.5, 0, 0], ...
    'm', 10, ...
    'Jm', 1e-4, ...
    'G', 500, ...
    'B', 10e-4, ...
    'Tc', 10e-4, ...
    'qlim', [-90 90]*rad_to_deg );

L(3) = Revolute('d', 0, 'a', 1, 'alpha', 0,  ...
    'I', [0.0125, 0.83958, 0.83958], ...
    'r', [1.5, 0, 0], ...
    'm', 10, ...
    'Jm', 1e-4, ...
    'G', 500, ...
    'B', 10e-4, ...
    'Tc', 10e-4, ...
    'qlim', [-90 90]*rad_to_deg );

Manipulator = SerialLink(L, 'name', 'Manipulator (3 DOF)');

position_HOME = [0 pi/2 0];
position_HOLD = [0 0 0]; 
clear L

figure(1)
Manipulator.plot(position_HOME)
Manipulator.teach()

%Home position of the Manipulator
Jac_1 = Manipulator.jacob0(position_HOME);
gravitational_load_1 = Manipulator.gravload([0, 0, 1]);
Torque_1 = Jac_1.*gravitational_load_1


Manipulator.plot(position_HOLD)
Manipulator.teach()

%Hold position of the Manipulator
Jacobian_2 = Manipulator.jacob0(position_HOLD);
gravitational_load_2 = Manipulator.gravload([0, 0, 1]);
Torque_2 = Jac_2.*gravitational_load_2