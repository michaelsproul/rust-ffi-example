#[no_mangle]
pub extern "C" fn get_rust_int() -> *mut i32 {
    Box::into_raw(Box::new(66))
}
