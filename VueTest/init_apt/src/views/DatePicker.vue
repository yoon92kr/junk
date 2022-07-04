<template>
  <Datepicker v-model="date" :disabledDates="disabledDates" />
</template>

<script>
import { ref, computed } from "vue";

export default {
  setup() {
    const date = ref(new Date());

    // For demo purposes disables the next 2 days from the current date
    const disabledDates = computed(() => {
      const today = new Date();

      const tomorrow = new Date(today);
      tomorrow.setDate(tomorrow.getDate() + 1);

      const afterTomorrow = new Date(tomorrow);
      afterTomorrow.setDate(tomorrow.getDate() + 1);

      return [tomorrow, afterTomorrow];
    });

    return {
      disabledDates,
      date,
    };
  },
};
</script>
