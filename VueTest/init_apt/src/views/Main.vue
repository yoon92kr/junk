<template>
  <div>
    <button id="btn">click me</button>
  </div>
</template>

<script>
import $ from 'jquery';

export default {
  mounted() {
  
    $('#btn').click(function() {
      alert('hi');
    });
    
  }
}
</script>
 
