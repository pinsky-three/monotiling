function setup() {
  createCanvas(800, 800);
  background(255);
  translate(width / 3, height / 9);
  scale(60);
  noStroke();

  chunk_proto_1();
}

function chunk_2() {
  let x = 7.327;
  let y = 6.686;
  let rot = -120;

  chunk_proto_2();

  applyTransformations(
    [{ x: x - 0.407, y: y + 11.432, rot: rot + 60 }],
    chunk_1
  );
}

function chunk_proto_2() {
  chunk_proto_1();

  let x = 7.327;
  let y = 6.686;
  let rot = -120;

  applyTransformations(
    [
      { x: x, y: y, rot: rot },
      { x: x - 6.23, y: y + 3.87, rot: rot + 60 },
      { x: x - 6.868, y: y + 7.969, rot: rot + 120 },
      { x: x - 7.099, y: y + 0.638, rot: rot + 180 },
      { x: x - 16.551, y: y + 1.9, rot: rot + 180 },
      { x: x - 10.327, y: y - 1.965, rot: rot + 240 },
    ],
    chunk_1
  );
}

function chunk_1() {
  let x = 0;
  let y = 0;
  let rot = 30;

  chunk_proto_1();

  applyTransformations(
    [{ x: x + 0.228, y: y + 7.324, rot: rot + 60, col: "blue" }],
    spectre
  );
}

function chunk_proto_1() {
  let x = 0;
  let y = 0;
  let rot = 0;

  applyTransformations(
    [
      {
        x: x + sqrt(3) - 3 / 2,
        y: y + (3 / 2) * sqrt(3),
        rot: rot,
        col: "rgb(91,38,234)",
      },

      { x: x, y: y, rot: rot + 30, col: "rgb(249,113,43)" },

      { x: x + sqrt(3), y: y + 2 * sqrt(3) + 3, rot: rot + 30, col: "red" },
      { x: x + sqrt(3), y: y + sqrt(3) + 3, rot: rot - 30, col: "green" },

      {
        x: x + (3 / 2) * sqrt(3),
        y: y + sqrt(3) + 3 / 2,
        rot: rot - 90,
        col: "rgb(150,208,61)",
      },
      {
        x: x + ((3 / 2) * 1) / sqrt(3),
        y: y + sqrt(2 / 3) + PI + 1,
        rot: rot + 90,
        col: "yellow",
      },

      { x: x + PI + 3 / PI, y: y + PI + 3 / PI, rot: rot - 30, col: "blue" },
      {
        x: x - 2 / PI,
        y: y + PI + 3 / PI,
        rot: rot + 150,
        col: "rgb(39,197,212)",
      },
    ],
    spectre
  );
}

function applyTransformations(transforms, drawFunc) {
  for (let t of transforms) {
    push();
    if (t.col) fill(t.col);
    translate(t.x, t.y);
    rotate(radians(t.rot));
    if (drawFunc === spectre) {
      scale(1, 1, 0.2);
    }
    drawFunc();
    pop();
  }
}

function spectre() {
  let kvals = [0, -2, 1, 3, 3, 5, 2, 4, 7, 9, 6, 8, 11, 9];
  let sines = kvals.map((k) => sin(radians(k * 30)));
  let cosines = kvals.map((k) => cos(radians(k * 30)));
  let displacements = kvals.map((_, i) => createVector(cosines[i], sines[i]));

  let points = [];
  let curpos = createVector(0, 0);

  for (let i = 0; i < kvals.length; i++) {
    points.push(curpos.copy());
    curpos.add(displacements[i]);
  }

  beginShape();
  points.forEach((p) => vertex(p.x, p.y));
  endShape(CLOSE);
}
