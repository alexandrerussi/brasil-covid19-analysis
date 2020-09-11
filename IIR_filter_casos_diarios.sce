casos_novos1 = fscanfMat("C:\Users\Junior\Documents\Dev e tecnologias\GitHub\brasil-covid19-analysis\output\casos_novos.txt");
casos_novos = [casos_novos1];

t = 0:1:194;
n = length(t);

x = casos_novos
x_transp = x'

hz = iir(3, 'hp', 'butt', 50/n, []);
y_3 = flts(x_transp, hz);

hz = iir(6, 'hp', 'butt', 50/n, []);
y_6 = flts(x_transp, hz);

hz = iir(9, 'hp', 'butt', 50/n, []);
y_9 = flts(x_transp, hz);

plot(t, x, "k");
plot(t, y_3, "m");
plot(t, y_6, "g");
xtitle("Casos de COVID-19 por data de notificação no Brasil (IIR)", "Data de notificação", "Casos diários")
legend(["Casos diários"], ["IIR ordem 3"], ["IIR ordem 6"], ["IIR ordem 9"], 2);
xs2png(0,'C:\Users\Junior\Documents\Dev e tecnologias\GitHub\brasil-covid19-analysis\graphs\casos_covid_iir.png');
xs2png(gcf(),'C:\Users\Junior\Documents\Dev e tecnologias\GitHub\brasil-covid19-analysis\graphs\casos_covid_iir.png');
