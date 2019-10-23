$(document).ready(function(){
    $(".modal").modal();
    $("#modalFormLogin").validetta({
        bubblePosition: 'bottom',
        bubbleGapTop: 10,
        bubbleGapLeft: -5,
        onValid:function(e){
            e.preventDefault();
            $('.modal').modal("close");
           
            /*
            var elem = $("#modalFormLogin");
            var instance = M.Modal.getInstance(elem);
            instance.close();
            */
                
            var boleta = $("#boleta").val();
            var contrasena = $("#contrasena").val();
            var checkDatos = getObjects(js,boleta,contrasena);
                
            if(checkDatos.length == 1){
                $("#formLogin").trigger("reset");
                $.alert({
                    title:"<h5 class='blue-text'>TWeb / Sem. 20201</h5>",
                    content:"<h6 class='center-align'>Bienvenido!!!</h6>",
                    type:"green",
                    theme:"material",
                    boxWidth: '640px',
                    useBootstrap: false,
                    icon:"fas fa-check-circle"
                });
            }else{
                $.alert({
                    title:"<h5 class='blue-text'>TWeb / Sem. 20201</h5>",
                    content:"<h6 class='center-align'>Se present&oacute; un error. Favor de intentar nuevamente.</h6>",
                    type:"red",
                    theme:"material",
                    boxWidth: '640px',
                    useBootstrap: false,
                    icon:"fas fa-exclamation-circle"
                });
            }
        }
    });
});