function robot = KR160_robot_model()
    % KR 160 R1570 nano robotunun tanımı

    % DH parametrelerine göre her bir eklemin tanımı
    L1 = Link('d',  0.500, 'a',  0.250, 'alpha', -pi/2, 'offset',   0,     'standard');
    L2 = Link('d',  0.000, 'a', -0.610, 'alpha',    0,  'offset', -pi,    'standard');
    L3 = Link('d',  0.000, 'a', -0.070, 'alpha',  pi/2, 'offset',  pi/2,  'standard');
    L4 = Link('d', -0.710, 'a',  0.000, 'alpha',  pi/2, 'offset', -pi,    'standard');
    L5 = Link('d',  0.000, 'a',  0.000, 'alpha',  pi/2, 'offset', -pi,    'standard');
    L6 = Link('d', -0.215, 'a',  0.000, 'alpha',    pi, 'offset', -pi,    'standard');

    % Eklemlerin minimum ve maksimum açı limitleri (derece → rad)
    L1.qlim = deg2rad([-185 185]);
    L2.qlim = deg2rad([-145 45]);
    L3.qlim = deg2rad([-130 145]);
    L4.qlim = deg2rad([-179 179]);
    L5.qlim = deg2rad([-120 120]);
    L6.qlim = deg2rad([-179 179]);

    % Robot modeli oluşturuluyor
    robot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'KR160_R1570_nano');

    % Uç efektör (tool) tanımı - uç nokta 10 cm ileri
    robot.tool = transl(0,0,0.1);

    % Taban (base) yüksekliği - 25 cm yukarı
    robot.base = transl(0,0,0.25);
end
