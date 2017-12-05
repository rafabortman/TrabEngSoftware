// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
//= require jquery
//= require jquery_ujs
//= require_tree .
$( document ).ready(function() {
        var jogadaUserId = $('.stamp').attr('id');
        var loggedUser = $('.loggedId').attr('id');
        
        
        if(jogadaUserId!=loggedUser){
                $('.deleteBtn').hide();
        }

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
                                location.reload();
                        }
                });
        });

        $('#btn_share_facebook').click(function(){
                window.open('http://www.facebook.com/share.php?u=' + location.href);
        });

        $(function(){
                $('.starsContainer').rating(function(vote, event){
                        var path = window.location.pathname.toString().split("/");
                        var jogadaId = path[path.length-1];
                        $.ajax({
                                type: "POST",
                                url: "/pontos",
                                data: {
                                        jogada_id:jogadaId,
                                        nota:vote
                                },
                                dataType: "json",
                                complete: function (response) {
                                        location.reload();
                                }
                                
                        });    
                });
        });

        $('.deleteBtn').click(function(){
                var comentarioId = $(this).attr('id');
                $.ajax({
                        type: "POST",
                        url: "/deleteComentarios",
                        data: {
                                id:comentarioId
                        },
                        dataType: "json",
                        complete: function (response) {
                                location.reload();
                        }
                        
                });    
        });

});