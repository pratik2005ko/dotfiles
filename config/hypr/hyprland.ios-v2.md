# Hyprland iOS-Style Animation Config — V2 (With Jerk/Rebound)

**Backup date:** Sat 30 May 2026
**File:** `~/.config/hypr/hyprland.conf`

## Animations Block

```ini
animations {
    enabled = yes, please :)

    bezier = iosSpring,     0.25, 0.1,  0.25, 1
    bezier = iosEaseOut,    0.0,  0.0,  0.25, 1
    bezier = iosEaseInOut,  0.42, 0.0,  0.25, 1
    bezier = iosBounce,     0.22, 1,    0.36, 1
    bezier = iosRebound,    0.2,  1.5,  0.4,  0.85

    animation = global,        1,     10,    default
    animation = border,        1,     4,     iosEaseInOut
    animation = windows,       1,     7,     iosSpring,      popin
    animation = windowsIn,     1,     5,     iosRebound,     popin 60%
    animation = windowsOut,    1,     4,     iosEaseOut,     popin
    animation = fadeIn,        1,     4,     iosEaseInOut
    animation = fadeOut,       1,     2,     iosEaseOut
    animation = fade,          1,     4,     iosEaseInOut
    animation = layers,        1,     5,     iosSpring
    animation = layersIn,      1,     5,     iosSpring,      fade
    animation = layersOut,     1,     2.5,   iosEaseOut,     fade
    animation = fadeLayersIn,  1,     3.5,   iosEaseInOut
    animation = fadeLayersOut, 1,     2,     iosEaseOut
    animation = workspaces,    1,     5,     iosEaseInOut,   slide
    animation = workspacesIn,  1,     5,     iosBounce,      slide
    animation = workspacesOut, 1,     3,     iosEaseOut,     slide
    animation = zoomFactor,    1,     5,     iosSpring
}
```

## Bezier Curve Reference

| Curve | X0 | Y0 | X1 | Y1 | Feel |
|-------|----|----|----|----|------|
| `iosSpring` | 0.25 | 0.1 | 0.25 | 1 | Smooth ease-in-out, standard iOS |
| `iosEaseOut` | 0.0 | 0.0 | 0.25 | 1 | Fast start, slow settle |
| `iosEaseInOut` | 0.42 | 0.0 | 0.25 | 1 | Slow start/end, fast middle |
| `iosBounce` | 0.22 | 1 | 0.36 | 1 | Spring-like overshoot |
| `iosRebound` | 0.2 | 1.5 | 0.4 | 0.85 | Hits border, rebounds back |

## Animation Styles

- **Workspaces** — slide (page swipe)
- **Windows open** — popin 60% with rebound (zooms in, hits border, bounces back)
- **Windows close** — popin (shrinks to a point like iOS closing app)
- **Speed:** 5 on windowsIn for smooth, visible bounce

## Restore

```bash
# Replace the animations {} block in hyprland.conf with the one above
hyprctl reload
```
