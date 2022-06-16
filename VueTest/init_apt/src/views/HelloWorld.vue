<template>
  <h1>This is Main page</h1>
</template>

<script>
export default {
  name: "HelloWorld",
  mounted() {
    this.test();
  },
  methods: {
    test() {
      console.log("Call Stack Test Start"); // A

      setTimeout(function () {
        console.log("setTimeout");
      }, 0);

      Promise.resolve()
        .then(function () {
          // CallBack 1
          console.log("promise1");
        })
        .then(function () {
          // CallBack 2
          console.log("promise2");
        });

      console.log("Call Stack Test End");
    },
    webCrawling() {
      const axios = require("axios");
      const cheerio = require("cheerio");
      const log = console.log;

      const getHtml = async () => {
        try {
          return await axios.get("https://www.yna.co.kr/sports/all");
        } catch (error) {
          console.error(error);
        }
      };

      // request Library
      // axios
      // cheerio
      getHtml()
        .then((html) => {
          let ulList = [];
          const $ = cheerio.load(html.data);
          const $bodyList = $("div.headline-list ul").children("li.section02");

          $bodyList.each(function (i, elem) {
            ulList[i] = {
              title: $(this).find("strong.news-tl a").text(),
              url: $(this).find("strong.news-tl a").attr("href"),
              image_url: $(this).find("p.poto a img").attr("src"),
              image_alt: $(this).find("p.poto a img").attr("alt"),
              summary: $(this).find("p.lead").text().slice(0, -11),
              date: $(this).find("span.p-time").text(),
            };
          });

          const data = ulList.filter((n) => n.title);
          return data;
        })
        .then((res) => log(res));
    },
    fetchTest() {
      fetch("https://localhost:3000/user/post", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          id: "asd123",
          description: "hello world",
        }),
      }).then((response) => console.log(response));
    },
  },
};
</script>
