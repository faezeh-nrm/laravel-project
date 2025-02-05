<div class="header-area" id="headerArea">
    <div class="container h-100 d-flex align-items-center justify-content-between d-flex rtl-flex-d-row-r">
      <!-- Logo Wrapper -->
      <div class="logo-wrapper"><a href="home.html"><img src="img/core-img/logo-small.png" alt=""></a></div>
     <div class="navbar-logo-container d-flex align-items-center">
       
      
      <!-- Cart Icon -->
        <div class="cart-icon-wrap"><a href="{{route('CartItems')}}"><i class="fa-solid fa-bag-shopping"></i>
        <span>
          
          @if(Auth::check())  {{auth()->user()->carts->count()}}@endif 

        </span></a></div>
          <div><span></span><span></span><span></span></div>
        </div>
      </div>
    </div>
  </div>
  <div class="offcanvas offcanvas-start suha-offcanvas-wrap" tabindex="-1" id="suhaOffcanvas" aria-labelledby="suhaOffcanvasLabel">
    <!-- Close button-->
    <button class="btn-close btn-close-white" type="button" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    <!-- Offcanvas body-->
    <div class="offcanvas-body">
    </div>
  </div>
  <!-- PWA Install Alert -->
