const axios = require("axios");
const csv = require("csv-parser");
const fs = require("fs");
const { exec } = require("child_process");

const CSV_URL =
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vRFxBKhgVO89V4wIMs30zqUKrHscQey4oNL-gMztRBBYS6BFMIWOQNwVUQCLP1yqRvaE2RhjcyZTb63/pub?gid=0&single=true&output=csv";

function intervalFunc() {
  console.log("intervalFunc");
  let results = [];
  axios({
    method: "get",
    url: CSV_URL,
    responseType: "stream",
  }).then(function (response) {
    response.data.pipe(fs.createWriteStream("tmp.csv"));

    fs.createReadStream("tmp.csv")
      .pipe(csv())
      .on("data", (data) => results.push(data))
      .on("end", () => {
        //   console.log(results);
        let allIPs = [];
        results.forEach((r) => {
          allIPs.push(r.ip);
        });
        //   console.log(allIPs);
        let usedip = [];
        try {
          usedip = JSON.parse(fs.readFileSync("usedip.txt", "utf8"));
          // console.log('usedip', usedip);
        } catch (err) {
          console.error(err);
        }
        results.forEach((r) => {
          if (!usedip.includes(r.ip)) {
            //sshpass -p 'PifCbiaENAhKxeF4eirE' ssh root@65.108.215.89 wget -O antipropaganda_setup.sh https://raw.githubusercontent.com/qu4ma/antipropaganda/main/antipropaganda_setup.sh && chmod +x antipropaganda_setup.sh && sudo ./antipropaganda_setup.sh && sudo ~/antipropaganda/fuckputin.sh &
            console.log("new ip", r.ip);
            let cmd =
              "sshpass -p '" +
              r.password +
              "' ssh root@" +
              r.ip +
              " touch up && wget -O antipropaganda_setup.sh https://raw.githubusercontent.com/qu4ma/antipropaganda/main/antipropaganda_setup.sh && chmod +x antipropaganda_setup.sh && sudo ./antipropaganda_setup.sh &";
            console.log(cmd);
            exec(cmd, (error, stdout, stderr) => {
              if (error) {
                console.log(`error: ${error.message}`);
                return;
              }
              if (stderr) {
                console.log(`stderr: ${stderr}`);
                return;
              }
              console.log(`stdout: ${stdout}`);
            });
          }
        });
        fs.writeFile("./usedip.txt", JSON.stringify(allIPs), function (err) {
          if (err) {
            console.error(err);
          }
        });
      });
  });
}

setInterval(intervalFunc, 1000 * 60 * 60);
intervalFunc();