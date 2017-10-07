// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
//= require jquery
//= require jquery_ujs
//= require_tree .
$( document ).ready(function() {
        $('#btn_comment_send').click(function(){
                var path = window.location.pathname.toString().split("/");
                var jogadaId = path[path.length-1];
                var comentario = $('#txt_comment').val();
                $.ajax({
                        type: "POST",
                        url: "/comentarios",
                        data: {
                                jogada_id:jogadaId,
                                comentario:comentario
                        },
                        dataType: "json",
                        success: function (response) {
                                alert(JSON.stringify(response))
                                location.reload();
                        }
                });
        });
});