function komplexes_skalarprodukt_demo()
    % ---------------- Einstellungen ----------------
    x = 2 + 1i;         % Vektor x (komplexe Zahl)
    y = -1 + 2i;         % Vektor y (komplexe Zahl)
    % ------------------------------------------------

    % Inneres Produkt (sesquilinear): <x,y> = x * conj(y)
    ip = x * conj(y);
    nx = abs(x); ny = abs(y);
    theta_x = angle(x); theta_y = angle(y);
    phase_ip = angle(ip);    % sollte = theta_x - theta_y sein
    proj_coeff = ip / (y*conj(y));  % Skalar
    proj_xy = proj_coeff * y;       % Projektion von x auf span{y}
    err = x - proj_xy;              % Orthogonal-Anteil (im C^1 trivial, in höheren Dim. anschaulich)

    % ---------- Plot-Vorbereitung ----------
    figure('Color','w'); hold on; axis equal;
    % Achsen
    ax = gca; ax.Box = 'on';
    xlabel('Re'); ylabel('Im'); grid on;

    % Dynamische Achsenskalierung
    pts = [0,0; real(x),imag(x); real(y),imag(y); real(proj_xy),imag(proj_xy); real(conj(y)),imag(conj(y))];
    m = max(1, ceil(max(abs(pts),[],'all')*1.2));
    xlim([-m-1 m]); ylim([-m-1 m]);

    % ---------- Hilfsfunktionen ----------
    drawVec = @(z, varargin) quiver(0,0, real(z), imag(z), 0, 'LineWidth',1.8, varargin{:});
    drawSeg = @(z1,z2,varargin) plot([real(z1) real(z2)],[imag(z1) imag(z2)], varargin{:});

    % ---------- Vektoren ----------
    hX = drawVec(x,'MaxHeadSize',0.25,'Color',[0 0.45 0.74]);         % x
    hY = drawVec(y,'MaxHeadSize',0.25,'Color',[0.85 0.33 0.10]);      % y
    hProj = drawVec(proj_xy,'MaxHeadSize',0.25,'Color',[0.47 0.67 0.19]); % proj_y(x)
    hErr = drawSeg(proj_xy,x,'LineStyle','--','LineWidth',1.4,'Color',[0.3 0.3 0.3]); % Residuum

    % Konjugation: ȳ (Spiegelung an Re-Achse) – macht den Winkelabzug sichtbar
    hYbar = drawVec(conj(y),'MaxHeadSize',0.25,'Color',[0.49 0.18 0.56]);

    % ---------- Skalarprodukt -4 ----------
    ip_extra = -4; % gewünschtes Skalarprodukt
    hExtra = drawVec(ip_extra, 'Color',[0.93 0.69 0.13]);    % als Vektor im Argand-Diagramm

    % ---------- Winkelbogen (Phase des Skalarprodukts) ----------
    rArc = 0.25*m;
    ang1 = theta_y; ang2 = theta_x;
    if wrapToPi(ang2-ang1) < 0, tmp=ang1; ang1=ang2; ang2=tmp; end
    t = linspace(ang1, ang2, 100);
    plot(rArc*cos(t), rArc*sin(t), 'k-', 'LineWidth',1.2);
    % Pfeilspitze am Bogen
    drawSeg(rArc*cos(t(end-1:end)), rArc*sin(t(end-1:end)), 'k-');
    text(1.05*rArc*cos((ang1+ang2)/2), 1.05*rArc*sin((ang1+ang2)/2)+0.5, ...
        sprintf('Δφ = -90.0°', rad2deg(wrapToPi(theta_x-theta_y))), ...
        'HorizontalAlignment','center','FontWeight','bold');

    % ---------- Annotationen ----------
    txt = {
        sprintf('x = %.2f %+ .2fi, |x|=%.3g, \\angle x=%.1f^\\circ', real(x), imag(x), nx, rad2deg(theta_x))
        sprintf('y = %.2f %+ .2fi, |y|=%.3g, \\angle y=%.1f^\\circ', real(y), imag(y), ny, rad2deg(theta_y))
        sprintf('Komplexes Skalarprodukt: S3 = %.2f ', ip_extra)
        };
    annotation('textbox',[0.62 0.12 0.35 0.35],'String',txt,'FitBoxToText','on','BackgroundColor',[1 1 1]);

    % Legende
    legend([hY hYbar hProj hExtra], ...
        {'B','B (Konjugation)','A','S3'}, ...
        'Location','northoutside','NumColumns',3);

    title('Komplexes Skalarprodukt \langle A,B \rangle (Geometrische Ansicht)');
end

function a = wrapToPi(a)
    a = mod(a+pi, 2*pi) - pi;
end
