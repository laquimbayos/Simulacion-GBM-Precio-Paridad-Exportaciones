#################################################
install.packages("xts")
library(xts)
library(tidyverse)
library(readxl)
library(quantmod)

rm(list=ls())


df <- read_excel("C:/Users/57350/Desktop/GITHUB/MODELAJE Y SIMULACIÓN/APLICACION DEL MOVIMIENTO BROWNIANO GEOMÉTRICO/DATA/datos_gasolina_nafta.xlsx")
View(df)
attach(df)

## Alpha & Sigma de UNL87

UNL87= xts(df$`UNL87 (USD)`, order.by = df$Fecha)
rets_UN = dailyReturn(UNL87,type="log")
sigma_UN = sd(rets_UN)*sqrt(252)
print(sigma_UN)
alpha_UN <- mean(rets_UN)*252 + 1/2*sigma_UN^2
print(alpha_UN)

## Alpha & Sigma de NAFTA

Nafta= xts(df$`Nafta (USD)`, order.by = df$Fecha)
rets_NA = dailyReturn(Nafta,type="log")
sigma_NA = sd(rets_NA)*sqrt(252)
print(sigma_NA)
alpha_Na <- mean(rets_NA)*252 + 1/2*sigma_NA^2
print(alpha_Na)

# Simulacion de trayectorias del movimiento browniano geometrico (GBM) de UNL87 y NAFTA
#DEfinimos los parametros

R = 1000
T = 1
n = 252
dt = T/n

TRM = 4800
FL = 0.12
CT = 0.05

#Para no hacer larga la ecuación del GBM resumimos en partes las ecuaciones:

# Para NAFTA
parte1 = (alpha_Na-1/2*sigma_NA^2)*dt
parte2 = sigma_NA * sqrt(dt)

#Para UNL87
parte3 = (alpha_UN-1/2*sigma_UN^2)*dt
parte4 = sigma_UN * sqrt(dt)

#Definimos las matrices, PTT es la variable de interés resultado del cálculo. 
GBM_NA <- matrix(ncol = R, nrow = n)
GBM_UN <- matrix(ncol = R, nrow = n)
PTT <- matrix(ncol = R, nrow = n)

#Realizamos el ciclo:

for (r in 1:R) {
  GBM_NA[1,r] <- Nafta[755]
  GBM_UN[1,r] <- UNL87[755]
  for (day in 2:n) {
      epsilon <- rnorm(1)
      GBM_NA[day, r] <- GBM_NA[(day-1), r]*exp(parte1 + parte2*epsilon)
      GBM_UN[day, r] <- GBM_UN[(day-1), r]*exp(parte3 + parte4*epsilon)
      PTT[day,r] <- ((0.7*GBM_NA[day, r]) + (0.3*GBM_NA[day, r]) - FL - CT)*TRM
  }
}

#Gráficamos:

hist(PTT)
ts.plot(PTT)

#Obtenemos probabilidades:
mean(PTT[252,])
sd(PTT[252,])
hist(PTT[252,])
quantile(PTT[252,], prob=c(0.05,0.50,0.95))


#Realizamos una transformación pivote 
ptt_df <- as.data.frame(PTT) %>%
  mutate(ix = 1:nrow(PTT)) %>%
  pivot_longer(-ix, names_to = 'PTT', values_to = 'Valor')


#Graficamos las diferentes series de tiempo con colores
ptt_df %>%
  ggplot(aes(x=ix, y=Valor, color=PTT)) +
  geom_line() +
  theme(legend.position = 'none')






