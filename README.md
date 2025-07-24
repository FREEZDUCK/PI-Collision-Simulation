# 🧮 PI-Collision-Simulation

<p align="center">
  <img width="128" height="128" src="https://github.com/user-attachments/assets/10a7b8de-0aed-4500-88d8-318f2bfc3c72" alt="icon" />
</p>

**Godot 4 기반 완전 탄성 충돌 시뮬레이터**  
두 개의 물체가 충돌하면서 발생하는 충돌 횟수를 통해 원주율(π, pi) 값을 유추해보는 흥미로운 물리 실험입니다.

---

## 🧠 프로젝트 개요

이 시뮬레이터는 다음 원리에 기반합니다:

> 질량비가 100^n : 1인 두 물체가 완전 탄성 충돌을 반복할 때,  
> 충돌 횟수는 π의 소숫점 n자리와 관계가 있습니다.

이 알고리즘은 Grant Sanderson (3Blue1Brown)의 영상  
["π와 충돌 횟수의 관계"](https://www.youtube.com/watch?v=HEfHFsfGXjs)  
에서 소개된 내용을 바탕으로 구현되었습니다.

---

## 🎮 주요 기능

- ✅ 완전 탄성 충돌 구현
- ✅ Godot 4 기반 실시간 시뮬레이션
- ✅ 질량을 설정하면 자동으로 충돌 횟수 카운팅
- ✅ 충돌 횟수를 통해 π 근사값을 시각적으로 확인 가능
