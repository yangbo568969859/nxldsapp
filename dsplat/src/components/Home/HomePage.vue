<template>
    <div>
        <app-header :id="id"></app-header>
        <homecontent></homecontent>
        <app-footer :footid="footid"></app-footer>
    </div>
</template>

<script>
    import Header from '../Header.vue'
    import Footer from '../Footer.vue'
    import HomeContent from './homecontent.vue'
    export default {
        name: 'homepage',
        data () {
            return {
                id:1,
                footid:1,
            }
        },
        components:{
            'app-header':Header,
            'homecontent':HomeContent,
            'app-footer':Footer,
        }
    }
</script>

<style scoped>

</style>