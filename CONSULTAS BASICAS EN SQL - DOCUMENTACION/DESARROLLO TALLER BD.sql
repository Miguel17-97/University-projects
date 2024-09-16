Select zona.cod_zona, zona.nom_zona, puesto.cod_puesto, puesto.nom_puesto
from zona INNER JOIN puesto on zona.cod_zona = puesto.cod_zona;

Select audiencia.nro_audienc, audiencia.ced_propiet, propietario.nom_propiet 
from  audiencia INNER JOIN propietario on audiencia.ced_propiet = propietario.ced_propiet
order by audiencia.nro_audienc asc;

select agente.nom_agente, agente.nro_agente, vehiculo.nro_placa, vehiculo.marca, vehiculo.modelo, infraccion.cod_infrac
from vehiculo
INNER JOIN infraccion on vehiculo.nro_placa = infraccion.nro_placa
INNER JOIN  agente on agente.nro_agente = infraccion.nro_agente;

select accidente.cod_zona, accidente.nro_acta, accidente.des_acc, zona.nom_zona 
from accidente inner join zona on zona.cod_zona = accidente.cod_zona;

select agente.*, puesto.nom_puesto from agente inner join puesto on puesto.cod_puesto = agente.cod_puesto;

select inf_nor.*, norma.nom_norma from inf_nor inner join norma on norma.cod_norma = inf_nor.cod_norma 
where inf_nor.cod_norma = '125';


select inf_nor.*, norma.nom_norma from inf_nor inner join norma on norma.cod_norma = inf_nor.cod_norma 
where inf_nor.cod_norma = '124';

select  accidente.fecha_acc, veh_acc.nro_placa, veh_pro.ced_propiet, propietario.nom_propiet
from veh_acc inner join veh_pro on veh_pro.nro_placa = veh_acc.nro_placa
inner join propietario on veh_pro.ced_propiet = propietario.ced_propiet
inner join accidente on veh_acc.nro_acta = accidente.nro_acta;

select infraccion.fec_infrac, vehiculo.nro_placa
from infraccion INNER JOIN vehiculo on vehiculo.nro_placa = infraccion.nro_placa
where infraccion.fec_infrac between to_date ('01/01/99') and to_date ('31/12/99');

select agente.nom_agente, agente.cod_puesto, puesto.nom_puesto, puesto.cod_zona, zona.nom_zona
from agente inner join puesto on puesto.cod_puesto = agente.cod_puesto 
inner join zona on zona.cod_zona = puesto.cod_zona;
