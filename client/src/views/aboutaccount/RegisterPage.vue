<template>
    <div>
        <section id="app">
            <nav class="navSize">
                <div class="itemLeft">
                    <router-link to="/">
                    <img src="https://bulma.io/images/bulma-logo.png" style="width: 120px;">
                    </router-link>
                    <!-- Md - Sm = ShowHamburger -->
                    <div class="hamburgerNav" style="cursor: pointer;" @click="navburger = !navburger">
                    <div class="hamburger"></div>
                    <div class="hamburger"></div>
                    <div class="hamburger"></div>
                    </div>
                </div>
                <div class="itemCenter">
                    <div>
                    <a class="navbar-item itemSpacing">
                    Shop
                    </a>
                    </div>
                    <a class="navbar-item itemSpacing" >
                    Redeem
                    </a>
                    <a class="navbar-item itemSpacing">
                    myCart
                    </a>
                    <a class="navbar-item">
                    Feedback
                    </a>
                </div>
                <div class="itemRight">
                    <a class="navbar-item">
                    Login
                    </a>
                    <a class="navbar-item">
                    Sign Up
                    </a>
                </div>
                </nav>
                <div v-show="navburger" class="clickHamburger">
                <a class="navbar-item borderItem">
                    Shop
                </a>
                <a class="navbar-item borderItem">
                    Redeem
                </a>
                <a class="navbar-item borderItem">
                    MyCart
                </a>
                <a class="navbar-item borderItem">
                    Feedback
                </a>
                <div style="display: flex; margin-left: 1em; height: 65px;">
                    <button class="button is-light heightCenter">
                    Login
                    </button>
                    <p style="margin-left: 3em; margin-right: 3em; margin-top: auto; margin-bottom: auto;">Or</p>
                    <button class="button is-light heightCenter">
                    Sign Up
                    </button>
                </div>
            </div>
            <div class="absolute-center">
                    <div class="formBox">
                        <div class="formInfo">
                            <p class="textform-left mb-5" style="font-size:24px;"> Sign up </p>
                            <form action="/login/" enctype="multipart/form-data" method="POST">

                            <div class="field">
                                <label class="label textform-left">Email</label>
                                <div class="control">
                                    <input class="input is-small" type="email" placeholder="hello@example.com"
                                            autocomplete="username" required />
                                </div>
                            </div>
                            
                            <div class="field">
                                <label class="label textform-left">Password</label>
                                <div class="control">
                                    <input class="input is-small" type="password" placeholder="**********"
                                    autocomplete="current-password" required />
                                </div>
                            </div>
                            <div class="field">
                                <label class="label textform-left">Confirm Password</label>
                                <div class="control">
                                    <input class="input is-small" type="password" placeholder="**********"
                                    autocomplete="current-password" required />
                                </div>
                            </div>

                            <!-- <div class="field">
                                <label class="label textform-left">Address</label>
                                <div class="control">
                                    <textarea class="textarea is-small" placeholder="เช่น 123/4 ถนนห้ามหวง เขตหวงห้าม กรุงเทพมหานคร 12345"></textarea>
                                </div>
                            </div> -->
                
                            <div class="field is-grouped mt-4">
                                <div class="control">
                                    <button class="button is-block is-fullwidth is-primary is-small" type="submit">
                                        Register
                                    </button>
                                </div>
                                <div class="control">
                                    <button class="button is-block is-fullwidth is-primary is-small is-link is-light">Cancel</button>
                                </div>
                            </div>
                        </form>
                        </div>
                    </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    data() {
      return {}
    }
  }
</script>

<style scoped>
</style>