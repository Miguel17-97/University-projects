document.getElementById('my-button').addEventListener('click',function(){
    link = 'http://localhost:9090/job/PipelineBoton/build?token=TOKEN'
    window.open(link);
});

document.getElementById('my-button-2').addEventListener('click',function(){
    link = 'http://localhost:9090/job/TomcatBoton/build?token=TOKEN'
    window.open(link);
});