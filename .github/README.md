# GitHub Actions Workflows

Ce dossier contient les workflows GitHub Actions pour automatiser les builds de l'application Clock Made of Clocks.

## Workflows Disponibles

### 1. `release.yml` - Création de Release

**Déclenchement**: À la création d'un tag `v*` (exemple: `v1.0.0`)

**Actions**:
1. Build toutes les plateformes
2. Crée une GitHub Release
3. Upload automatiquement tous les builds

**Comment créer une release**:

```bash
# 1. Mettez à jour la version dans pubspec.yaml
version: 1.0.0+1

# 2. Committez les changements
git add pubspec.yaml
git commit -m "chore: bump version to 1.0.0"

# 3. Créez et poussez le tag
git tag v1.0.0
git push origin main
git push origin v1.0.0
```

Le workflow créera automatiquement une release sur GitHub avec tous les builds téléchargeables.

## Structure des Jobs

### Job: build-web-android
- **Runner**: `ubuntu-latest`
- **Durée**: ~5-10 minutes
- **Builds**: Web + Android

### Job: build-ios-macos
- **Runner**: `macos-latest`
- **Durée**: ~15-20 minutes
- **Builds**: iOS (si possible) + macOS

### Job: build-windows
- **Runner**: `windows-latest`
- **Durée**: ~10-15 minutes
- **Builds**: Windows

### Job: build-linux
- **Runner**: `ubuntu-latest`
- **Durée**: ~8-12 minutes
- **Builds**: Linux

## Optimisations

- ✅ Utilisation du cache Flutter pour accélérer les builds
- ✅ Builds en parallèle pour toutes les plateformes
- ✅ Génération automatique des localisations
- ✅ Continue-on-error pour iOS (évite l'échec si SDK manquant)

## Maintenance

### Mettre à jour la version de Flutter

Modifiez la ligne suivante dans tous les workflows:

```yaml
- name: Setup Flutter
  uses: subosito/flutter-action@v2
  with:
    flutter-version: '3.32.3'  # ← Changez cette version
```

### Modifier la rétention des artifacts

Par défaut, les artifacts sont conservés 30 jours (builds) ou 5 jours (releases).

Modifiez la ligne:
```yaml
retention-days: 30  # Changez ce nombre
```

## Troubleshooting

### Le build iOS échoue
C'est normal si le SDK iOS n'est pas installé sur le runner. Le workflow continue malgré l'erreur (`continue-on-error: true`).

### Le build Android échoue
Vérifiez que Java 17 est bien configuré dans le workflow.

### Le workflow ne se déclenche pas
- Vérifiez que les fichiers sont dans `.github/workflows/`
- Vérifiez que vous avez poussé sur la branche `main`
- Vérifiez les permissions GitHub Actions dans Settings > Actions

## Ressources

- [Documentation GitHub Actions](https://docs.github.com/en/actions)
- [subosito/flutter-action](https://github.com/subosito/flutter-action)
- [Flutter CI/CD Guide](https://docs.flutter.dev/deployment/cd)