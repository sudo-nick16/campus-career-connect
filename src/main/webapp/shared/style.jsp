<%--
  Created by IntelliJ IDEA.
  User: sudonick
  Date: 1/9/23
  Time: 6:51 PM
  To change this template use File | Settings | File Templates.
--%>
<style type="text/tailwindcss">
    @layer utilities {
        *{
            font-family: 'Inter', sans-serif;
        }
        .container{
            @apply w-[1240px] mx-auto;
        }
        .center {
            @apply flex items-center justify-center;
        }
        .fcenter{
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .h-flare::after{
            content: "";
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            box-shadow: 0px 4px 150px 100px rgba(255, 199, 0, 0.4);
        }
        .btn-flare::after{
            content: "";
            position: absolute;
            top: 50%;
            left: 50%;
            width: 50%;
            z-index: -1;
            transform: translate(-50%, -50%);
            box-shadow: 0px 4px 70px 20px rgba(255, 199, 0, 0.4);
        }
        .nav-flare::after{
            content: "";
            position: absolute;
            bottom: 0;
            right: 0;
            width: 10%;
            z-index: -1;
            box-shadow: 0px 4px 70px 20px rgba(255, 199, 0, 0.4);
        }
        .selected{
            @apply bg-orange;
        }
        .table > * {
            @apply p-2 border border-yellow text-yellow center;
        }
        label{
            @apply font-bold text-yellow text-lg;
        }
        input{
            @apply text-lg px-1 text-yellow border-yellow border-b-2 outline-none bg-transparent;
        }
        body {
            @apply bg-blue;
        }
        button{
            @apply relative text-blue font-bold bg-yellow rounded-md py-2 px-8 hover:opacity-90;
        }
    }
    @layer componets {
        button{
            @apply relative text-blue font-bold bg-yellow rounded-md py-2 px-8;
        }
    }
</style>