$(document).on("ready pjax:success",function(){function e(){$(".sub-menu").each(function(){$(this).hasClass("active")&&($(this).parent().prev().addClass("active"),$(this).parent().prev().addClass("open"),$(this).parent().slideDown())})}e()}),$(function(){function e(){$(".sub-menu").each(function(){$(this).hasClass("active")&&($(this).parent().prev().addClass("active"),$(this).parent().slideDown())})}var n=$(".nav-stacked").width();$(".navbar-header").width(n);var s=[],a=null,t=0;$(".sidebar-nav li").each(function(e,n){$(n).hasClass("dropdown-header")?(a=t++,s[a]=[]):$(n).addClass("sub-menu sub-menu-"+a)});for(var i=0;i<=s.length;i++)$(".sub-menu-"+i).wrapAll("<div class='sub-menu-container' />");$(".sub-menu-container").hide(),e(),$(".dropdown-header").bind("click",function(){$(".dropdown-header").removeClass("open"),$(this).addClass("open"),$(".dropdown-header").removeClass("active"),$(".sub-menu-container").stop().slideUp(),$(this).toggleClass("active"),$(this).next(".sub-menu-container").stop().slideDown()})});