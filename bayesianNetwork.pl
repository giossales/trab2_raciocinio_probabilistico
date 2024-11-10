% Definindo probabilidades marginais (variáveis independentes)
0.1::str(snow_covered).
0.9::str(dry).
0.3::dynamo_flywheel_worn.
0.95::bulb_ok.
0.98::cable_ok.

% Probabilidades condicionais para variáveis dependentes
% Probabilidade de deslizamento do dínamo dependendo da condição da rua
0.7::dynamo_sliding :- str(snow_covered).
0.3::dynamo_sliding :- \+str(snow_covered).

% Probabilidade de o dínamo gerar voltagem dependendo do deslizamento
0.85::voltage :- dynamo_sliding.
0.3::voltage :- \+dynamo_sliding.

% Probabilidade de a luz estar ligada, dependendo das condições da voltagem, lâmpada e cabo
0.9::light_on :- voltage, bulb_ok, cable_ok.
0.1::light_on :- voltage, \+bulb_ok, cable_ok.
0.05::light_on :- \+voltage, bulb_ok.
0.95::light_on :- \+voltage, \+bulb_ok.

% Definindo a condição (evidência) de que a rua está coberta de neve
evidence(str(snow_covered)).

% Consultando a probabilidade de voltagem
query(voltage).

