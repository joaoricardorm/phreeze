if(document.all && !window.atob){ //9 or older
    $('#oldBrowserMessage').html('<div class="container alert alert-danger white" style="box-sizing: border-box"><h1 class="white-text">Seu navegador é muito antigo e pode não funcionar adequadamente nesse site.<br>Por favor, atualize-o.</h1></div>');
}

//Habilita o onpopstate para botoes voltar e avancar funcionarem
window.onpopstate = function(e) {
    if (e.state) {
        window.location.reload();
    }
};

//DIMINUI O TOPO AO ROLAR
$(window).scroll(function() {
    if($(window).width() > 767){
        var a=$(window).scrollTop();
        if(a > 100){
            $('.navbar').addClass('scroll');
        } else {
            $('.navbar').removeClass('scroll');
        }
        if(a > 150){
            $('.navbar').addClass('scroll-more');
        } else {
            $('.navbar').removeClass('scroll-more');
        }
    }
});

isMobile = false;
if(navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|IEMobile)/)) {
    isMobile = true;
}

$('.modal').on('show',function() {
    $('.modal:not(.btn-bottom-enabled) .modal-footer .btn').prop('disabled',true);

    setTimeout(function() {
        $('.modal').on('change', 'input, select, option, textarea, #btnUpload', function () {
            $('.modal .modal-footer .btn').removeAttr("disabled");
        });
    }, 1000);

});

//CONVERSOR RGB TO HEX
var hexDigits = new Array
("0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f");

//Function to convert hex format to a rgb color
function rgb2hex(rgb) {
    rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
    return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
}

function hex(x) {
    return isNaN(x) ? "00" : hexDigits[(x - x % 16) / 16] + hexDigits[x % 16];
}

//FUNÇÃO PARA BINARIO E HEXADECIMAL (BASE_64_ENCODE) BIN PHP
String.prototype.hex2bin = function()
{
    var i = 0, len = this.length, result = "";

    //Converting the hex string into an escaped string, so if the hex string is "a2b320", it will become "%a2%b3%20"
    for(; i < len; i+=2)
        result += '%' + this.substr(i, 2);

    return unescape(result);
}

/*verifica se array contem outro array */
function contemArray(arr1, arr2) {
    var tem = arr2.filter(function (elem) {
            return arr1.indexOf(elem) > -1;
        }).length == arr1.length

    return tem;
}

//MODAL PARA EDITAR NA PAGINA ATUAL
/*
 $('.btnEditarModal').click(function(e){
 e.preventDefault();
 el = $(this);
 $('body').append('<div id="modalTemp"></div>');
 console.log(base+$(this).data('url-modal'));
 $('#modalTemp').load(base+$(this).data('url-modal'));
 setTimeout(function(){
 $('#abrirModal').data('id',el.data('id')).click();
 },1000);
 //$('#newSicafUsuarioButton').click();
 //page.showDetailDialog();
 });
 */

$('.btnEditarModal').click(function(e){
    //e.preventDefault();
    $('#modalTemp .modal-body iframe').attr('src',$(this).data('url-modal'));
    $('#modalTemp').modal('show').removeClass('hide').addClass('in');
});

//FULL SCREEN EM DIV LISTA
$('body').on('click','.fullscreen-grid-btn', function() {

   $(this).find('i').toggleClass('fa-expand fa-compress');

   if($('#jarviswidget-fullscreen-mode').length) { //se já estiver em full screen
       $(this).attr('data-original-title','Ampliar');
       $('body').removeClass('nooverflow');
       $('#widget-grid').unwrap();
   } else {
       $(this).attr('data-original-title','Reduzir');
       $('body').addClass('nooverflow');
       $('#widget-grid').wrap('<div id="jarviswidget-fullscreen-mode" style="background: rgba(255,255,255,0.7)" />');
   }
});

function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
}

if(getUrlParameter('sp')){
    $('body').addClass('single-item');
}
