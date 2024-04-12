# Changelog

## 0.5.1

* Migrate to `spago@next`. Publish on Purescript packages.

## 0.2.6
 
* `F.S.Functions`:
  * `delay` no longer selects for effect with a closed typeclass
* Upgraded build to purescript 0.3.5

## 0.2.5

* `F.S.Functions`:
  * `delay` now uses a closed typeclass to select for Effect
* Brought all the deps used for build and test up to date
* Fixed warnings

## 0.2.4

* `F.S.Objects`:
  * `keys`
  * `removeProperty` (`(!-)`, infix 9, probably wrong, please suggest a better value)
  * Made `(.=)` infix 9. This is probably still wrong, please suggest a better value.
  * Made `(!=)` infix 9. This is probably still wrong, please suggest a better value.

## 0.2.3

Improvements:

* `F.S.Globals`:
  * Made `global` check not just `window`, but also `globalThis`,
    `global`, so supporting any environment. But nodejs is shit, so
    it's basically useless in that environment.
* `F.S.Objects`:
  * `downcast`
* Improved tests for existing functionality

New:

* `F.S.Functions`:
  * `new`
* `F.S.Objects`:
  * Property checks:
    * `hasOwnProperty` - non-inherited props
    * `isIn` - possibly inherited props
  * Safer Property access:
    * `(.?)`
	* `maybeGetProperty`
	* `maybeGetProperty'`
* `F.S.Undef`:
  * `maybeUndef` - the `Maybe` analogue of `nullUndef`

## 0.2.2

Improvements:

* `F.S.Globals`:
  * Warns on module load if `window` is not defined
  * If `window` is not defined:
	* `global` will always return `Nothing`
    * `unsafeGlobal` will always quietly return `undef`

## 0.2.1

Breakages:

* `F.S.Undef`:
  * `Undefined` -> `Undef`
  * `undefined` -> `undef`

New:

* `F.S.Globals`:
  * `unsafeGlobal` - Assume a global will be present, quietly return
    `undef` if it is not. (Bring your own safety!)

## 0.2.0

Breakages:

* `F.S.Functions`:
  * `bind'` -> `bindTo`
  * `apply` -> `applyTo`
  * `delay` now takes a value to provide
* `F.S.Objects`:
  * `typeof` -> `typeOf`

New:

* `F.S.Globals` (new module):
  * `global` - look up a global by name
* `F.S.Objects`:
  * `instanceOf` - wrapper for js `instanceof`
  * `(.=)` / `setProperty'` to set a property
  * `(!=)` / `defineProperty'` to define a readonly property

## 0.1.2

* Remove `F.S.Require` as i can't figure out how to make a build work with it.
* Remove `call`, `callMethod` and `callMethod'` from `F.S.Functions`
* Add `F.S.Functions.delay`
* Made dotty operators infixl
* Depend on effect and refs

## 0.1.1

* Add `F.S.PseudoArray.unshift`


