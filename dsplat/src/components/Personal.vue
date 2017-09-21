<template>
    <div>
        <perheader></perheader>
        <percontent></percontent>
        <app-footer :footid="footid"></app-footer>
    </div>
</template>

<script>
    import PerHeader from './Personal/PerHeader.vue'
    import PerContent from './Personal/PerContent.vue'
    import Footer from './Footer.vue'
    export default {
        data () {
            return {
                footid:3,
            }
        },
        components:{
            'app-footer':Footer,
            'perheader':PerHeader,
            'percontent':PerContent,
        }
    }
</script>

<style>

</style>