# Git Workflow — Inception-of-Things

Nous travaillons à deux sur le même repository GitHub.

## Branches principales

* `main` : branche stable du projet.
* `ahmed` : branche de travail d'Ahmed.
* `deden` : branche de travail de Deden.

Nous ne travaillons pas directement sur `main`.

## Avant de commencer à travailler

Toujours récupérer la dernière version de `main` :

```bash
git switch main
git pull origin main
```

Puis revenir sur sa branche :

Ahmed :

```bash
git switch ahmed
git merge main
```

Deden :

```bash
git switch deden
git merge main
```

## Pendant le travail

Chaque personne travaille uniquement sur sa propre branche.

Ahmed :

```bash
git switch ahmed
```

Deden :

```bash
git switch deden
```

Après une modification :

```bash
git add .
git commit -m "description de la modification"
git push
```

## Intégration dans main

Quand une tâche est terminée :

1. Push de la branche sur GitHub.
2. Création d'une Pull Request vers `main`.
3. L'autre membre vérifie les modifications.
4. Tester la fonctionnalité.
5. Merge dans `main` seulement si tout fonctionne.

Workflow :

```text
ahmed ──────┐
            ├── Pull Request → Review → main
deden ──────┘
```

## Après un merge

Les deux membres récupèrent le nouveau `main` :

```bash
git switch main
git pull origin main
```

Puis mettent à jour nos branche :

```bash
git switch ahmed
git merge main
```

ou :

```bash
git switch deden
git merge main
```

## Règles importantes

* Ne jamais coder directement sur `main`.
* Toujours faire un `git pull` avant de commencer une nouvelle session.
* Faire des petits commits avec des messages clairs.
* Ne pas modifier exactement le même fichier en même temps si possible.
* Tester avant chaque Pull Request.
* L'autre membre doit comprendre les changements avant le merge.
* `main` doit toujours rester fonctionnelle.

## Organisation du projet

La structure demandée par le sujet doit rester :

```text
.
├── p1/
│   ├── Vagrantfile
│   ├── scripts/
│   └── confs/
├── p2/
│   ├── Vagrantfile
│   ├── scripts/
│   └── confs/
├── p3/
│   ├── scripts/
│   └── confs/
└── bonus/
```

## Objectif

Chaque fonctionnalité suit ce cycle :

```text
Task
 ↓
Development
 ↓
Test
 ↓
Push
 ↓
Pull Request
 ↓
Review
 ↓
Merge
 ↓
main
```
