
% 逐层出现余弦波，验证恒等式
% cos(2*pi*t) = 0.5*cos(2*pi*t) + 0.5*cos[2*pi*(-1)*t]
clear; clc; close all;

% ===== 时间轴：两个周期，正负对称 =====
t = linspace(-1, 1, 2000);

% ===== 三层信号 =====
y1 = 1.0 * cos(2*pi*1*t);       % 左边：cos(2*pi*t)
y2 = 0.5 * cos(2*pi*1*t);       % 右边第 1 项
y3 = 0.5 * cos(2*pi*(-1)*t);    % 右边第 2 项

% ===== 各层频率平面 =====
f1 = 1;
f2 = 1;
f3 = -1;

% ===== 各层振幅 =====
C1 = 1.0;
C2 = 0.5;
C3 = 0.5;

% ===== 绘图初始化（上下扩大） =====
figure('Position', [50 50 1400 1100], 'Color', 'w', ...
       'MenuBar', 'figure');
hold on; grid on; box on;

axis([-1 1 -2 2 -2 2]);
set(gca, 'XTick', [-1 -0.5 0 0.5 1]);
set(gca, 'YTick', -2:1:2);
set(gca, 'ZTick', -2:1:2);

xlabel('时间 t');
ylabel('频率 n');
zlabel('幅度');

view(45, 25);

% ===== 标题：用图内文本，避免被截 =====
eq_title = 'cos(2\pi t) = 0.5cos(2\pi t) + 0.5cos[2\pi(-1)t]';
text(0.5, 1.02, eq_title, 'Units', 'normalized', ...
     'HorizontalAlignment', 'center', ...
     'FontSize', 13, 'FontWeight', 'bold');

% ===== GIF 保存 =====
gif_filename = 'C:\Users\cheny\Desktop\cosine_stack.gif';
gif_delay = 1.2;
frame_count = 0;

% =========================================================
% 第 0 帧：空白
% =========================================================
drawnow;

frame_count = frame_count + 1;
frame = getframe(gcf);
im = frame2im(frame);
[A, map] = rgb2ind(im, 256);
imwrite(A, map, gif_filename, 'gif', ...
        'LoopCount', Inf, 'DelayTime', gif_delay);

% =========================================================
% 第 1 帧：左边 cos(2*pi*t)，n=1，振幅=1
% 只画曲线和红点，不加竖线和紫点
% =========================================================
plot3(t, f1*ones(size(t)), y1, 'b', 'LineWidth', 2);
plot3(0, f1, C1, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

drawnow;

frame_count = frame_count + 1;
frame = getframe(gcf);
im = frame2im(frame);
[A, map] = rgb2ind(im, 256);
imwrite(A, map, gif_filename, 'gif', ...
        'WriteMode', 'append', 'DelayTime', gif_delay);
pause(1.2);

% =========================================================
% 第 2 帧：右边第 1 项 0.5*cos(2*pi*t)，n=1，振幅=0.5
% =========================================================
plot3(t, f2*ones(size(t)), y2, 'r', 'LineWidth', 2);
plot3(0, f2, C2, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot3([0 0], [f2 f2], [0 C2], 'r-', 'LineWidth', 1.5);
plot3(0, f2, 0, 'mo', 'MarkerSize', 8, 'MarkerFaceColor', [0.8 0.2 0.8]);

drawnow;

frame_count = frame_count + 1;
frame = getframe(gcf);
im = frame2im(frame);
[A, map] = rgb2ind(im, 256);
imwrite(A, map, gif_filename, 'gif', ...
        'WriteMode', 'append', 'DelayTime', gif_delay);
pause(1.2);

% =========================================================
% 第 3 帧：右边第 2 项 0.5*cos(-2*pi*t)，n=-1，振幅=0.5
% =========================================================
plot3(t, f3*ones(size(t)), y3, 'm', 'LineWidth', 2.5);
plot3(0, f3, C3, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot3([0 0], [f3 f3], [0 C3], 'r-', 'LineWidth', 1.5);
plot3(0, f3, 0, 'mo', 'MarkerSize', 8, 'MarkerFaceColor', [0.8 0.2 0.8]);

drawnow;

frame_count = frame_count + 1;
frame = getframe(gcf);
im = frame2im(frame);
[A, map] = rgb2ind(im, 256);
imwrite(A, map, gif_filename, 'gif', ...
        'WriteMode', 'append', 'DelayTime', 1.8);

hold off;

